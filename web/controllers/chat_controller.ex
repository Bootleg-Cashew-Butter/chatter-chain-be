defmodule ChatterChain.ChatController do
  use ChatterChain.Web, :controller
  import Ecto.Query, only: [from: 2]

  alias ChatterChain.Chat
  alias ChatterChain.User
  alias ChatterChain.Post

  plug :scrub_params, "chat" when action in [:create, :update]

  def index(conn, _params) do
    chats = Repo.all(Chat)
    render(conn, "index.json", chats: chats)
  end

  def create(conn, %{"chat" => chat_params}) do
    changeset = Chat.changeset(%Chat{}, chat_params)

    case Repo.insert(changeset) do
      {:ok, chat} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", chat_path(conn, :show, chat))
        |> render("show.json", chat: chat)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(ChatterChain.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    chat = Repo.get!(Chat, id) |> Repo.preload([:users, :posts])
    render(conn, "show.json", chat: chat)
  end

  def update(conn, %{"id" => id, "chat" => chat_params}) do
    chat = Repo.get!(Chat, id)
    changeset = Chat.changeset(chat, chat_params)

    case Repo.update(changeset) do
      {:ok, chat} ->
        render(conn, "show.json", chat: chat)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(ChatterChain.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    chat = Repo.get!(Chat, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(chat)

    send_resp(conn, :no_content, "")
  end
end
