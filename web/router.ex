defmodule FindAFluff.Router do
  use FindAFluff.Web, :router

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

  scope "/", FindAFluff do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  scope "/api", FindAFluff do
    pipe_through :api # Use the default browser stack

    get "/pets", PetController, :index
    get "/pets/:id", PetController, :show
    get "/regions", RegionController, :index
    get "/species", SpeciesController, :index
  end


  # Other scopes may use custom stacks.
  # scope "/api", FindAFluff do
  #   pipe_through :api
  # end
end
