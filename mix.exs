defmodule PromTest.MixProject do
  use Mix.Project

  def project do
    [
      app: :prom_test,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {PromTest.Application, []},
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:bandit, ">= 0.7.5"},
      {:telemetry, "~> 1.0"},
      {:telemetry_metrics, "~> 0.6.1"},
      {:telemetry_metrics_prometheus_core, "~> 1.1.0"}

      # {:prometheus_ex, "~> 3.0"},
      # {:prometheus_plugs, "~> 1.1"}
    ]
  end
end
