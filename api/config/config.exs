# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :chat_web, ChatWeb.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "chat_web_repo",
  username: "postgres",
  password: "postgres",
  hostname: "pg-hack-trip"


# Exported port
config :chat_web, :port, 80

config :chat_web, Repo,
  adapter: Ecto.Adapters.Postgres

config :chat_web, ecto_repos: [ChatWeb.Repo]
