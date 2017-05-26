defmodule Phgeox.Web.Router do
  use Phgeox.Web, :router

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

  scope "/", Phgeox.Web do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/utenti", UtenteController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Phgeox.Web do
  #   pipe_through :api
  # end
end