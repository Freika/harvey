# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :harvey,
  ecto_repos: [Harvey.Repo]

# Configures the endpoint
config :harvey, Harvey.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "q5OEN9xZOF2c7/fjBFP9WzoPO2mX9f6o7uyReyvFAl94kXZow1zKPIfgb2dXBMgz",
  render_errors: [view: Harvey.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Harvey.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
