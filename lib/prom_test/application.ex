defmodule PromTest.Application do
  @moduledoc """
  Documentation for `PromTest`.
  """
  use Application

  # import Telemetry.Metrics
  alias Telemetry.Metrics

  def metrics() do
    [
      Metrics.counter("http.request.count"),
      Metrics.sum("http.request.payload_size", unit: :byte)
      # Metrics.sum("websocket.connection.count", reporter_options: [prometheus_type: :gauge]),
      # Metrics.last_value("vm.memory.total", unit: :byte)
    ]
  end

  def start(_type, _args) do
    children = [
      {TelemetryMetricsPrometheus.Core, metrics: metrics()},
      {Bandit, plug: PromTest.Router}
    ]

    opts = [strategy: :one_for_one, name: PromTest.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
