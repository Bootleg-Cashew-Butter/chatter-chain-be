defmodule ChatterChain.UserView do
  use ChatterChain.Web, :view

  location "users/:id"
  attributes [:emoji, :username]
  has_one :chat, field: :chat_id, type: "chats"

  def render("index.json", %{users: users}) do
    %{data: render_many(users, ChatterChain.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, ChatterChain.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      emoji: user.emoji,
      username: user.username,
      chat_id: user.chat_id}
  end
end
