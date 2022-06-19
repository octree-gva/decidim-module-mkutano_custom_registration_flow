# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("lib", __dir__)

require "decidim/mkutano_custom_registration_flow/version"

Gem::Specification.new do |s|
  s.version = Decidim::MkutanoCustomRegistrationFlow.version
  s.authors = ["Hadrien Froger"]
  s.email = ["hadrien@octree.ch"]
  s.license = "AGPL-3.0"
  s.homepage = "https://github.com/octree-gva/decidim-module-mkutano_custom_registration_flow"
  s.required_ruby_version = ">= 2.7"

  s.name = "decidim-mkutano_custom_registration_flow"
  s.summary = "A decidim mkutano_custom_registration_flow module"
  s.description = "Custom registration flow for Mkutano's Decidim."

  s.files = Dir["{app,config,lib}/**/*", "LICENSE.md", "Rakefile", "README.md"]

  s.add_dependency "decidim-core", Decidim::MkutanoCustomRegistrationFlow.version
end
