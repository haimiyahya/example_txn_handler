defmodule ExampleTxnHandler.MixProject do
  use Mix.Project

  def project do
    [
      app: :example_txn_handler,
      version: "0.1.0",
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {ExampleTxnHandler.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ua_isomm, git: "https://github.com/haimiyahya/ua_isomm"},
      {:ex_iso8583, git: "https://github.com/haimiyahya/ex_iso8583"}
    ]
  end
end
