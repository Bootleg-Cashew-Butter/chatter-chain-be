defmodule ChatterChain.Repo.Migrations.CreatePost do
  use Ecto.Migration

  def change do
    create table(:posts, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :body, :text
      add :isLink, :boolean, default: false
      add :creator_id, references(:users, type: :binary_id)
      add :chat_id, references(:chats, type: :binary_id)

      timestamps
    end
    create index(:posts, [:creator_id])
    create index(:posts, [:chat_id])

  end
end
