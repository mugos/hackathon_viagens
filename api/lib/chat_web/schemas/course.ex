defmodule ChatWeb.Schemas.Course do
  use Ecto.Schema

  schema "courses" do
    field :name, :string
    field :description, :string
    field :price, :string
  end
end
