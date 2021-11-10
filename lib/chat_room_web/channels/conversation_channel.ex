defmodule ChatRoomWeb.ConversationChannel do
  use ChatRoomWeb, :channel
  alias ChatRoom.Chat

  @impl true
  def join("conversation:lobby", _payload, socket) do
    # if authorized?(payload) do
      IO.inspect("++++++++++++++++++Conversation Channel Join++++++++++++++++")
      IO.inspect(socket)
      {:ok, socket}
    # else
    #   {:error, %{reason: "unauthorized"}}
    # end
  end

  @impl true
  def handle_in("shout", payload, socket) do
    IO.inspect("++++++++++++++++++Conversation Channel Handle in++++++++++++++++")
    Chat.create_message(payload)
    IO.inspect("++++++++++++++++++broadcast socket, shout, payload++++++++++++++++")
    IO.inspect(socket)
    IO.inspect(payload) #This contains the name and body
    IO.inspect broadcast socket, "shout", payload

    {:noreply, socket}
  end

end
# Channels can be used in a request/response fashion
# by sending replies to requests from the client
# @impl true
# def handle_in("ping", payload, socket) do
#   {:reply, {:ok, payload}, socket}
# end

# # It is also common to receive messages from the client and
# # broadcast to everyone in the current topic (conversation:lobby).



# Add authorization logic here as required.
# defp authorized?(_payload) do
  #   true
  # end
