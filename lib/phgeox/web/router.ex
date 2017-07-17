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
    resources "/lito_001", Lito_001Controller
    resources "/mlito_001", MLito_001Controller

  end

  # Other scopes may use custom stacks.
  scope "/api", Phgeox.Web do
     pipe_through :api

     resources "/liv_due", Liv_dueController, only: [:index]
  end
end
