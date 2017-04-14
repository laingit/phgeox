# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :phgeox,
  ecto_repos: [Phgeox.Repo]

# Configures the endpoint
config :phgeox, Phgeox.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "NU7Okf8SyqWbPoR97G7IFK4GfKM2z/NoLfifMfkmhDeClo8GoAA1MBIERWymL3YZ",
  render_errors: [view: Phgeox.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Phgeox.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
