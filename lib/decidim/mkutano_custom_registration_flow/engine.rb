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
        # resources :mkutano_custom_registration_flow
        # root to: "mkutano_custom_registration_flow#index"
      end

      initializer "decidim_mkutano_custom_registration_flow.assets" do |app|
        app.config.assets.precompile += %w[decidim_mkutano_custom_registration_flow_manifest.js decidim_mkutano_custom_registration_flow_manifest.css]
      end 
      initializer "decidim_mkutano_custom_registration_flow.middleware" do |app|
        # Choose one of the flow: 
        
        # app.config.middleware.insert_after Warden::Manager, Decidim::MkutanoCustomRegistrationFlow::Middleware::VerifiedOnly
        app.config.middleware.insert_after Warden::Manager, Decidim::MkutanoCustomRegistrationFlow::Middleware::RegisteredOnly

      end
    end
  end
end
