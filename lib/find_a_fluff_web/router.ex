defmodule FindAFluffWeb.Router do
  use FindAFluffWeb, :router

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

  scope "/", FindAFluffWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api", FindAFluffWeb do
    pipe_through :api # Use the default browser stack

    get "/pets", PetController, :index
    get "/regions", RegionController, :index
    get "/species", SpeciesController, :index
    get "/races", RaceController, :index
  end


  # Other scopes may use custom stacks.
  # scope "/api", FindAFluff do
  #   pipe_through :api
  # end
end
