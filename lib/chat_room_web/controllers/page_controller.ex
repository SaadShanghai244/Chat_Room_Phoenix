defmodule ChatRoomWeb.PageController do
  use ChatRoomWeb, :controller
  alias ChatRoom.Chat

  def index(conn, _params) do
    messages = Chat.list_messages()
    render(conn, "index.html", messages: messages)
  end
end
