defmodule JargonApiTest do
  use ExUnit.Case
  doctest JargonApi

  test "greets the world" do
    assert JargonApi.hello() == :world
  end
end
