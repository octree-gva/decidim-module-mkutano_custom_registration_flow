module Decidim
  module MkutanoCustomRegistrationFlow
    # This type represents an AssembliesType.
    module APIPaywall
      policy = Proc.new do |object, context|
        current_user = context.dig(:current_user)
        current_organization = context.dig(:current_organization)
        raise GraphQL::ExecutionError, "An object was hidden due to permissions" unless current_user.present? && current_organization.present?
        return super(object, context) && Decidim::Authorization.left_outer_joins(:organization).where(
          decidim_organizations: { id: current_organization.id },
          user: current_user).where.not(granted_at: nil).exists?
      end
      Decidim::Assemblies::AssemblyType.define_singleton_method(:authorized?, policy)
      Decidim::Assemblies::AssemblyMemberType.define_singleton_method(:authorized?, policy)
    end
  end
end
