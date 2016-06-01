defmodule ChatterChain.Repo.Migrations.UniqueUserInfo do
  use Ecto.Migration

  def change do
    create unique_index(:users, [:emoji, :chat_id], name: :special_emoji_chat_index)
    create unique_index(:users, [:username, :chat_id], name: :special_username_chat_index)
  end
end
