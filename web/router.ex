defmodule ChatterChain.Router do
  use ChatterChain.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ChatterChain do
    pipe_through :api

    resources "/chats", ChatController, except: [:new, :edit]
    resources "/users", UserController, except: [:new, :edit]
    resources "/posts", PostController, except: [:new, :edit]
  end
end
