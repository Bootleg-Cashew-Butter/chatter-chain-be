defmodule ChatterChain.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :emoji, :string
      add :username, :string
      add :chat_id, references(:chats, type: :binary_id)

      timestamps
    end
    create index(:users, [:chat_id])

  end
end
