defmodule ChatWebTest do
  use ExUnit.Case, async: true
  use Plug.Test

  doctest ChatWeb

  setup do
    # Go back to a clean slate at the beginning of every test
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(ChatWeb.Repo)
  end

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

  test "ecto" do
    course = %ChatWeb.Schemas.Course{name: "not nice", description: "cool", price: "R$3,00"}

    assert {:ok, course} = ChatWeb.Repo.insert(course)

    assert ["not nice"] == ChatWeb.Schemas.Course |> ChatWeb.Repo.all
    |> Enum.map(&(&1.name))
    |> IO.inspect
  end

  test "multiple queryes" do
    courses = [
      %ChatWeb.Schemas.Course{name: "nice", description: "cool", price: "R$3,00"},
      %ChatWeb.Schemas.Course{name: "haha  nice", description: "super cool", price: "R$4,00"},
      %ChatWeb.Schemas.Course{name: "ooh nice", description: "extra cool", price: "R$5,00"}
    ]

    Enum.each(courses, fn (course) -> ChatWeb.Repo.insert(course) end)

    assert ["nice", "haha  nice", "ooh nice"] == ChatWeb.Schemas.Course |> ChatWeb.Repo.all
    |> Enum.map(&(&1.name))
    |> IO.inspect
  end
end
