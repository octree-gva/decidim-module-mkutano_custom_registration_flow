# frozen_string_literal: true

module Decidim
  module MkutanoCustomRegistrationFlow
    # This is the engine that runs on the public interface of `MkutanoCustomRegistrationFlow`.
    class AdminEngine < ::Rails::Engine
      isolate_namespace Decidim::MkutanoCustomRegistrationFlow::Admin

      paths["db/migrate"] = nil
      paths["lib/tasks"] = nil

      routes do
        # Add admin engine routes here
        # resources :mkutano_custom_registration_flow do
        #   collection do
        #     resources :exports, only: [:create]
        #   end
        # end
        # root to: "mkutano_custom_registration_flow#index"
      end

      def load_seed
        nil
      end
    end
  end
end
