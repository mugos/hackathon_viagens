defmodule ChatWeb.Router do
  use Plug.Router
  # use Plug.Debugger
  alias ChatWeb.Repo
  alias ChatWeb.Schemas.Course

  plug :match
  plug :dispatch

  plug Plug.Logger

  @doc """
  """
  get "/courses" do
    courses = Repo.all(Course)
    |> Enum.map(&(Map.take(&1, [:name, :description, :price])))
    |> Poison.encode!

    conn |> resp(200, courses)
  end

#   def create(conn, todo_params) do
#     changeset = Todo.changeset(%Todo{}, todo_params)

#     if changeset.valid? do
#       todo = Repo.insert(changeset)
#       render(conn, "show.json", todo: todo)
#     else
#       conn
#       |> put_status(:unprocessable_entity)
#       |> render(Todobackend.ChangesetView, "error.json", changeset: changeset)
#     end
#   end

#   def show(conn, %{"id" => id}) do
#     todo = Repo.get(Todo, id)
#     render conn, "show.json", todo: todo
#   end

#   def update(conn, todo_params = %{"id" => id}) do
#     todo = Repo.get(Todo, id)
#     changeset = Todo.changeset(todo, todo_params)

#     if changeset.valid? do
#       todo = Repo.update(changeset)
#       render(conn, "show.json", todo: todo)
#     else
#       conn
#       |> put_status(:unprocessable_entity)
#       |> render(Todobackend.ChangesetView, "error.json", changeset: changeset)
#     end
#   end

#   def delete(conn, %{"id" => id}) do
#     todo = Repo.get(Todo, id)

#     todo = Repo.delete(todo)
#     render(conn, "show.json", todo: todo)
#   end

#   def delete_all(conn, _params) do
#     Repo.delete_all(Todo)

#     todos = Repo.all(Todo)
#     render(conn, "index.json", todos: todos)
#   end

#   def options(conn, _params) do
#     conn
#     |> send_resp(200, "GET,POST,DELETE,OPTIONS,PUT")
#   end

  get "/hello" do
    conn |> resp(200, "world")
  end

  match _ do
    conn |> resp(404, "Oops")
  end
end


