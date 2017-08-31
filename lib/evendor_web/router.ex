defmodule EvendorWeb.Router do
  use EvendorWeb, :router

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

  scope "/", EvendorWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/categories/:name", CategoryController, :show

    # URSER AUTH
    get "/register", RegistrationController, :new
    post "/register", RegistrationController, :create
  end

  # Other scopes may use custom stacks.
  # scope "/api", EvendorWeb do
  #   pipe_through :api
  # end
end
