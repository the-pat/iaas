defmodule IaasWeb.Router do
  use IaasWeb, :router

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

  scope "/", IaasWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/:text/:size/identicon.png", PageController, :image
    get "/random", PageController, :random
  end
end
