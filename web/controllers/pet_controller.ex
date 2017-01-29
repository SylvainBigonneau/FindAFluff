defmodule FindAFluff.PetController do
  use FindAFluff.Web, :controller

  alias FindAFluff.Pet

  def index(conn, _params) do
    pets = Repo.all(Pet)
    |> Repo.preload(:race)
    |> Repo.preload(shelter: :region)
    |> Repo.preload(:species)
    
    render(conn, "index.json", pets: pets)
  end

  def show(conn, %{"id" => id}) do
    pet = Repo.get!(Pet, id)
    |> Repo.preload(:race)
    |> Repo.preload(shelter: :region)
    |> Repo.preload(:species)

    render(conn, "show.json", pet: pet)
  end

end
