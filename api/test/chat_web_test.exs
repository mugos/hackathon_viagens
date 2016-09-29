defmodule ChatWebTest do
  use ExUnit.Case, async: true
  use Plug.Test

  doctest ChatWeb

  @opts ChatWeb.Router.init([])
  # Define a higher timeout
  # @moduletag timeout: 300
  #
  test "the truth" do
    assert 1 + 1 == 2
  end

  test "handshake" do
    conn = conn(:get, "/hello")

    conn = ChatWeb.Router.call(conn, @opts)

    assert conn.state == :set
    assert conn.status == 200
    assert conn.resp_body == "world"
  end
end
