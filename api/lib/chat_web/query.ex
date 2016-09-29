defmodule ChatWeb.QueryWrapper do
  import RethinkDB.Query
  alias ChatWeb.Database

  require RethinkDB.Lambda
  import RethinkDB.Lambda

  def get_all_travel_agents do
    {:ok, travel_agents} = table("travel_agents") |> Database.run
    travel_agents.data
  end

  def create_travel_agent(new_travel_agent, ip_address) do
    {:ok, travel_agent} = table("travel_agents")
                  |> insert(new_travel_agent, %{return_changes: true})
                  |> Database.run


    travel_agent_id = hd(travel_agent.data["generated_keys"])
    {:ok, url_included} = table("travel_agents")
      |> get(travel_agent_id)
      |> update(lambda(fn (travel_agent) -> %{url: "http://" <> "localhost" <> ":8000/travel_agents/#{travel_agent_id}"} end),
                %{return_changes: true})
      |> Database.run

    hd(url_included.data["changes"])["new_val"]
  end

  def delete_all_travel_agents do
    {:ok, travel_agents} = table("travel_agents")
      |> delete
      |> Database.run

    travel_agents
  end

  def get_travel_agent_by_id(id_to_get) do
    {:ok, travel_agent} = table("travel_agents")
      |> filter(%{id: id_to_get})
      |> Database.run

    hd(travel_agent.data)
  end

  def update_travel_agent(id, changeset) do
    { :ok, updated_travel_agent } = table("travel_agents")
      |> get(id)
      |> update(changeset, %{return_changes: true})
      |> Database.run

    hd(updated_travel_agent.data["changes"])["new_val"]
  end

  def delete_travel_agent(id) do
    { :ok, delete_travel_agent  } = table("travel_agents")
      |> get(id)
      |> delete
      |> Database.run

    delete_travel_agent
  end

end
