defmodule ChatterChain.User do
  use ChatterChain.Web, :model

  schema "users" do
    field :emoji, :string
    field :username, :string
    belongs_to :chat, ChatterChain.Chat

    timestamps
  end

  @required_fields ~w(emoji username chat_id)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
