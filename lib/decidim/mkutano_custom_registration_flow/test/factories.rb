# frozen_string_literal: true

require "decidim/core/test/factories"

FactoryBot.define do
  factory :mkutano_custom_registration_flow_component, parent: :component do
    name { Decidim::Components::Namer.new(participatory_space.organization.available_locales, :mkutano_custom_registration_flow).i18n_name }
    manifest_name :mkutano_custom_registration_flow
    participatory_space { create(:participatory_process, :with_steps) }
  end

  # Add engine factories here
end
