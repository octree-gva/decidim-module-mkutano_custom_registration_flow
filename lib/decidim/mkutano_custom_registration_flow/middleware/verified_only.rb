module Decidim
  module MkutanoCustomRegistrationFlow
    module Middleware
      class VerifiedOnly
        def initialize(app)
          @app = app
        end

        def call(env)
          request = ActionDispatch::Request.new(env)
          return @app.call(env) unless request.path.starts_with? "/assemblies"
          current_user = env["warden"].user(:user)
          return redirect_400(request) unless current_user.present?
          current_organization = env["decidim.current_organization"]
          granted = Decidim::Authorization.left_outer_joins(:organization).where(
            decidim_organizations: { id: current_organization.id },
            user: current_user).where.not(granted_at: nil).exists?
          return redirect_400(request) unless granted || current_user.admin?
          @status, @headers, @response = @app.call(env)
          [@status, @headers, @response]
        end

        private
          def redirect_400(request)
            host = request.host_with_port
            protocol = request.protocol
            redirect_to = "#{protocol}#{host}/pages/welcome"
            [301, { "Location" => redirect_to }, self]
          end
      end
    end
  end
end
