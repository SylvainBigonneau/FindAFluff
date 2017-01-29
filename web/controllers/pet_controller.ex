defmodule FindAFluff.PetController do
  use FindAFluff.Web, :controller

  alias FindAFluff.Pet

  def index(conn, _params) do
    pets = Repo.all(Pet)
    |> Repo.preload(:race)
    |> Repo.preload(shelter: :region)
    |> Enum.map(fn(pet) ->
        Map.update(pet, :shelter, nil, fn(shelter) ->
          Map.update(shelter || %{}, :region, nil, &(Map.delete(&1 || %{}, :shelters)))
        end)
      end)
    |> Repo.preload(species: :races)
    |> Enum.map(fn(pet) ->
        Map.update(pet, :species, nil, &(Map.delete(&1 || %{}, :races)))
      end)
    
    render(conn, "index.json", pets: pets)
  end

  def show(conn, %{"id" => id}) do
    pet = Repo.get!(Pet, id)
    |> Repo.preload(:race)
    |> Repo.preload(shelter: :region)
    |> Map.update(:shelter, nil, fn(shelter) ->
         Map.update(shelter || %{}, :region, nil, &(Map.delete(&1 || %{}, :shelters)))
       end)
    |> Repo.preload(:species)
    |> Map.update(:species, nil, &(Map.delete(&1 || %{}, :races)))

    render(conn, "show.json", pet: pet)
  end

end
