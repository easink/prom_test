# PromTest

Simple program to test telemetry and prometheus

## Start Service

    > iex -S mix

## Test

    > curl http://127.0.0.1:4000/
    Hello World!
    > curl http://127.0.0.1:4000/
    Hello World!

    > curl http://127.0.0.1:4000/metrics
    # HELP http_request_payload_size 
    # TYPE http_request_payload_size counter
    http_request_payload_size 99
    # HELP http_request_count 
    # TYPE http_request_count counter
    http_request_count 2
