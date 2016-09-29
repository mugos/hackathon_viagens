defmodule HackatonViagensApi.Mixfile do
  use Mix.Project

  def project do
    [app: :hackaton_viagens_api,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :plug],
     mod: {HackatonViagensApi, []}]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:cowboy, "~> 1.0.0"},
      {:plug, "~> 1.0"},
      {:cors_plug, "~> 1.1"},
      {:socket, "~> 0.3.5"},
      {:erlbus, git: "https://github.com/cabol/erlbus.git", app: false},
      {:rethinkdb, git: "https://github.com/hamiltop/rethinkdb-elixir"},
      {:fluxter, "~> 0.1"},
      {:gproc, "~> 0.6.1"},
      {:kafka_ex, "~> 0.5.0"},
      {:guardian, "~> 0.13.0"}
    ]
  end
end
