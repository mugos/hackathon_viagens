defmodule ChatWeb.Types.Course do
  @moduledoc """
  Courses message structure
  """

  @derive [Poison.Encoder]
  defstruct [:name, :description, :price]
end

defmodule ChatWeb.Types do
  @moduledoc """
  My response structure
  """

  @derive [Poison.Encoder]
  # defstruct [:object, :entry]

  # @doc """
  # Decode a map into a `Core.Messenger.Types.Response`
  # """
  # @spec encode(map) :: Core.Messenger.Types.Response.t
  def encode(param) when is_list(param) do
    param
    |> IO.inspect
    Poison.Decode.decode(param, as: decoding_map)
  end

  def encode(param) when is_map(param) do
    Poison.Decode.decode(param, as: decoding_map)
  end

  defp decoding_map do
    messaging_parser =
      %ChatWeb.Types.Course{  }
  end
end
