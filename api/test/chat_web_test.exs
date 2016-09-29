defmodule ChatWebTest do
  use ExUnit.Case
  doctest ChatWeb

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "handshake" do
    conn = conn(:get, "/hello")

    conn = Peperoni.Router.call(conn, @opts)

    assert conn.state == :set
    assert conn.status == 200
    assert conn.resp_body == "world"
  end
end
