module Decidim
  module MkutanoCustomRegistrationFlow
    module Middleware
      class RegisteredOnly
        def initialize(app)
          @app = app
        end

        def call(env)
          request = ActionDispatch::Request.new(env)
          return @app.call(env) unless blocked_path?(request.path)
          current_user = env["warden"].user(:user)
          return redirect_400(request) unless current_user.present?
          @app.call(env)
        end

        private
          def redirect_400(request)
            host = request.host_with_port
            protocol = request.protocol
            redirect_to = "#{protocol}#{host}/users/sign_in"
            flash[:notice] = "You need to sign in to access this content"
            [301, { "Location" => redirect_to }, ["You are beeing redirected"]]
          end

          def blocked_path?(path)
            ["/assemblies","/processes", "/consultations", "/conferences", "/meetings"].any? {|blocked_path| path.start_with?(blocked_path) }
          end
      end
    end
  end
end
