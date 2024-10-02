defmodule ExampleTxnHandlerTest do
  use ExUnit.Case
  doctest ExampleTxnHandler

  test "greets the world" do
    assert ExampleTxnHandler.hello() == :world
  end
end
