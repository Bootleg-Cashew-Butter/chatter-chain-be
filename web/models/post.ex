defmodule ChatterChain.Post do
  use ChatterChain.Web, :model

  schema "posts" do
    field :body, :string
    field :isLink, :boolean, default: false
    belongs_to :creator, ChatterChain.User
    belongs_to :chat, ChatterChain.Chat

    timestamps
  end

  @required_fields ~w(body isLink creator_id chat_id)
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
