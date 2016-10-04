defmodule Harvey.Router do
  use Harvey.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Harvey do
    pipe_through :browser # Use the default browser stack

    get "/", RealmController, :index
    resources "/realms", RealmController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Harvey do
  #   pipe_through :api
  # end
end
