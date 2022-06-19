# Decidim::MkutanoCustomRegistrationFlow

Custom registration flow for Mkutano's Decidim.

## What does it?

This module add a middleware, that check all the routes starting with `/assemblies` slug.
In Mkutano's Decidim, we use [decidim donation module](https://github.com/decidiamo/decidim-module-donations/blob/main/decidim-donations.gemspec), and makes a paywall to access the assemblies.

**Only verified members can access the assemblies**. The module enforce this rule this way:

1. If the visitor is not connected => redirect to the `/pages/welcome`
2. If the user is connected, but not verified => redirect to the `/pages/welcome`
3. If the user is connected and verified (by any means) => show the assemblies.

## Usage

You can create public assemblies, they will all be under the paywall. If you want assemblies with others kind of validations/paywalls, you can creates private assemblies, and manage them manually through the insertion of [_Private Users_](https://docs.decidim.org/en/admin/spaces/assemblies/private_participants).

## Installation

Add this line to your application's Gemfile:

```ruby
gem "decidim-mkutano_custom_registration_flow", git: "https://github.com/octree-gva/decidim-mkutano_custom_registration_flow"
```

Then execute:

```bash
bundle
```

Finally, create a page with the slug `welcome`

## Contributing

See [Decidim](https://github.com/decidim/decidim).

## License

This engine is distributed under the [GNU AFFERO GENERAL PUBLIC LICENSE](LICENSE).
