defmodule DbTest do
  use ExUnit.Case
  doctest ChatWeb

  test "test things are being inserted" do
    # Clean Database
    RethinkDB.Query.table("travel_agents") |> RethinkDB.Query.delete |> ChatWeb.Database.run

    table_query = RethinkDB.Query.table("travel_agents")

    q = RethinkDB.Query.insert(table_query, %{name: "Hello", attr: "World"})

    {:ok, %RethinkDB.Record{data: %{"inserted" => 1, "generated_keys" => [key]}}} = ChatWeb.Database.run(q)

    {:ok, %RethinkDB.Collection{data: [%{"id" => ^key, "name" => "Hello", "attr" => "World"}]}} = ChatWeb.Database.run(table_query)
  end

  test "create and validate" do
    # Clean Database
    RethinkDB.Query.table("travel_agents")
      |> RethinkDB.Query.delete
      |> ChatWeb.Database.run

    # Create travel_agents
    insert_query = RethinkDB.Query.table("travel_agents")
      |> RethinkDB.Query.insert(%{name: "Carlos", attr: "22"})
      |> ChatWeb.Database.run

    { :ok, %RethinkDB.Record{data: %{"inserted" => 1, "generated_keys" => [key]}} } = insert_query
  end

  test "read" do
    # Clean Database
    RethinkDB.Query.table("travel_agents")
      |> RethinkDB.Query.delete
      |> ChatWeb.Database.run

    # Create travel_agents
    RethinkDB.Query.table("travel_agents")
      |> RethinkDB.Query.insert(%{"name" => "Carlos", "attr" => "22"})
      |> ChatWeb.Database.run

    # Read query
    read_query = RethinkDB.Query.table("travel_agents")
      |> ChatWeb.Database.run

    # IO.inspect read_query

    { :ok, %RethinkDB.Collection{data: [%{"id" => key, "name" => "Carlos", "attr" => "22"}]} } = read_query
  end
end
