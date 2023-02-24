# frozen_string_literal: true

require "rails"
require "decidim/core"

module Decidim
  module MkutanoCustomRegistrationFlow
    # This is the engine that runs on the public interface of mkutano_custom_registration_flow.
    class Engine < ::Rails::Engine
      isolate_namespace Decidim::MkutanoCustomRegistrationFlow

      routes do
        # Add engine routes here
        if ENV.fetch("REGISTRATION_FLOW", "registeredOnly") == "verifiedOnly"
          resources :mkutano_custom_registration_flow
          root to: "mkutano_custom_registration_flow#index"
        end
      end

      initializer "decidim_mkutano_custom_registration_flow.middleware" do |app|
        # Choose one of the flow: 
        current_flow = ENV.fetch("REGISTRATION_FLOW", "registeredOnly")
        if current_flow == "verifiedOnly"
          app.config.middleware.insert_after Warden::Manager, Decidim::MkutanoCustomRegistrationFlow::Middleware::VerifiedOnly
        else
          app.config.middleware.insert_after Warden::Manager, Decidim::MkutanoCustomRegistrationFlow::Middleware::RegisteredOnly
        end
      end
    end
  end
end
