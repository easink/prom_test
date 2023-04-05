defmodule PromTestTest do
  use ExUnit.Case
  doctest PromTest

  test "greets the world" do
    assert PromTest.hello() == :world
  end
end
