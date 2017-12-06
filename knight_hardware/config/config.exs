# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :knight_hardware,
  ecto_repos: [KnightHardware.Repo]

# Configures the endpoint
config :knight_hardware, KnightHardwareWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "xSUUiDRQEd1PuZMtaJ5jCxtA1h+wwJaSvyC2jIr1CdKtqwSYPlywU4QuS9A4xoq3",
  render_errors: [view: KnightHardwareWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: KnightHardware.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
