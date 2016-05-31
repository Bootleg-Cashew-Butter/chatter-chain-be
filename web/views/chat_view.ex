defmodule ChatterChain.ChatView do
  use ChatterChain.Web, :view

  def render("index.json", %{chats: chats}) do
    %{data: render_many(chats, ChatterChain.ChatView, "chat.json")}
  end

  def render("show.json", %{chat: chat}) do
    %{data: render_one(chat, ChatterChain.ChatView, "chat.json")}
  end

  def render("chat.json", %{chat: chat}) do
    %{id: chat.id}
  end
end
