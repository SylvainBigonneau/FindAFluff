# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :find_a_fluff,
  ecto_repos: [FindAFluff.Repo]

# Configures the endpoint
config :find_a_fluff, FindAFluffWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Ks8bc96OuSg55tm6yJ6iZ8QSO1OJ5jwCDu3Vf+sA2qw/9znNM4AeKHAyTUXm7WYH",
  render_errors: [view: FindAFluffWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: FindAFluff.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
