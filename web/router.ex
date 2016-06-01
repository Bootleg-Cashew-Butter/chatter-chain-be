defmodule ChatterChain.Router do
  use ChatterChain.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ChatterChain do
    pipe_through :api

    resources "/chats", ChatController, except: [:edit]
    resources "/users", UserController, except: [:edit]
    resources "/posts", PostController, except: [:edit]
  end
end
