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

    # USER REGISTER
    get "/register", UserRegistrationController, :new
    post "/register", UserRegistrationController, :create

    #USER SESSION
    get "/login", UserSessionController, :new
    post "/login", UserSessionController, :create
  end

  # Other scopes may use custom stacks.
  # scope "/api", EvendorWeb do
  #   pipe_through :api
  # end
end
