defmodule ChatWeb.Router do
  use Plug.Router
  # use Plug.Debugger

  plug :match
  plug :dispatch

  plug Plug.Logger
  plug CORSPlug


  @doc """
  """
  get "/hello" do
    conn |> resp(200, "world")
  end

  match _ do
    conn |> resp(404, "Oops")
  end
end


