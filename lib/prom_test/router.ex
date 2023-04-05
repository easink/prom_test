defmodule PromTest.Router do
  use Plug.Router
  alias Plug.Conn

  plug Plug.Logger
  plug :match
  plug Plug.Telemetry, event_prefix: [:prometheus_metrics, :plug]
  plug :dispatch

  get "/" do
    payload_size = :rand.uniform(100)
    :telemetry.execute([:http, :request], %{payload_size: payload_size}, %{})
    send_resp(conn, 200, "Hello, World!")
  end

  get "/metrics" do
    metrics = TelemetryMetricsPrometheus.Core.scrape()

    conn
    # |> Conn.put_private(:prometheus_metrics_name, name)
    |> Conn.put_resp_content_type("text/plain")
    |> Conn.send_resp(200, metrics)
  end

  match _ do
    send_resp(conn, 404, "not found")
  end
end
