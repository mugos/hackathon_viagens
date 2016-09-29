defmodule Core.Messenger.Types.Message do
  @moduledoc """
  Facebook message structure
  """

  @derive [Poison.Encoder]
  defstruct [:mid, :seq, :text]

  @type t :: %Core.Messenger.Types.Message{
    mid: String.t,
    seq: integer,
    text: String.t
  }
end

defmodule Core.Messenger.Types.User do
  @moduledoc """
  Facebook user structure
  """

  @derive [Poison.Encoder]
  defstruct [:id]

  @type t :: %Core.Messenger.Types.User{
    id: String.t
  }
end

defmodule Core.Messenger.Types.Messaging do
  @moduledoc """
  Facebook messaging structure, contains the sender, recepient and message info
  """
  @derive [Poison.Encoder]
  defstruct [:sender, :recipient, :timestamp, :message]

  @type t :: %Core.Messenger.Types.Messaging{
    sender: Core.Messenger.Types.User.t,
    recipient: Core.Messenger.Types.User.t,
    timestamp: integer,
    message: Core.Messenger.Types.Message.t
  }
end

defmodule Core.Messenger.Types.Entry do
  @moduledoc """
  Facebook entry structure
  """
  @derive [Poison.Encoder]
  defstruct [:id, :time, :messaging]

  @type t :: %Core.Messenger.Types.Entry{
    id: String.t,
    messaging: Core.Messenger.Types.Messaging.t,
    time: integer
  }
end

defmodule Core.Messenger.Types.Response do
  @moduledoc """
  Facebook messenger response structure
  """

  @derive [Poison.Encoder]
  defstruct [:object, :entry]

  @doc """
  Decode a map into a `Core.Messenger.Types.Response`
  """
  @spec parse(map) :: Core.Messenger.Types.Response.t

  def parse(param) when is_map(param) do
    Poison.Decode.decode(param, as: decoding_map)
  end

  @doc """
  Decode a string into a `Core.Messenger.Types.Response`
  """
  @spec parse(String.t) :: Core.Messenger.Types.Response.t

  def parse(param) when is_binary(param) do
    Poison.decode!(param, as: decoding_map)
  end

  @doc """
  Retrun an list of message texts from a `Core.Messenger.Types.Response`
  """
  @spec message_texts(Core.Messenger.Types.Response) :: [String.t]
  def message_texts(%{entry: entries}) do
    Enum.flat_map(entries, &Map.get(&1, :messaging))
      |> Enum.map(&( &1 |> Map.get(:message) |> Map.get(:text)))
  end

  @doc """
  Retrun an list of message sender Ids from a `Core.Messenger.Types.Response`
  """
  @spec message_senders(Core.Messenger.Types.Response) :: [String.t]
  def message_senders(%{entry: entries}) do
    Enum.flat_map(entries, &Map.get(&1, :messaging))
      |> Enum.map(&( &1 |> Map.get(:sender) |> Map.get(:id)))
  end


  defp decoding_map do
     messaging_parser =
    %Core.Messenger.Types.Messaging{
      "sender": %Core.Messenger.Types.User{},
      "recipient": %Core.Messenger.Types.User{},
      "message": %Core.Messenger.Types.Message{},
    }
    %Core.Messenger.Types.Response{
      "entry": [%Core.Messenger.Types.Entry{
        "messaging": [messaging_parser]
      }]}
  end

   @type t :: %Core.Messenger.Types.Response{
    object: String.t,
    entry: Core.Messenger.Types.Entry.t
  }
end
