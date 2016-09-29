defmodule HackathonViagensApi.Router.Router do
  use Plug.Router
  # use Plug.Debugger

  plug :match
  plug :dispatch

  plug Plug.Logger

  @doc """
  """
  get "/hello" do
    conn |> resp(200, "world")
  end

  @doc """
  """
  match _ do
    conn |> resp(404, "Oops")
  end
end

