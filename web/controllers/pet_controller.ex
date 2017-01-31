defmodule FindAFluff.PetController do
  use FindAFluff.Web, :controller

  alias FindAFluff.Pet

  def index(conn, params) do
    offset_value = Dict.get(params, "offset", 0)
    species = Dict.get(params, "species", "%")
    race = Dict.get(params, "race", "%")
    region = Dict.get(params, "region", "%")
    query = from p in Pet,
     join: sp in assoc(p, :species),
     join: ra in assoc(p, :race),
     join: sh in assoc(p, :shelter),
     join: re in assoc(sh, :region),
     where: like(fragment("to_char(?, 'FM999999999999')", sp.id), ^species)
            and like(fragment("to_char(?, 'FM999999999999')", ra.id), ^race)
            and like(fragment("to_char(?, 'FM999999999999')", re.id), ^region),
     limit: 12, offset: ^offset_value
    pets = Repo.all(query)
    |> Repo.preload(:race)
    |> Repo.preload(shelter: :region)
    |> Enum.map(fn(pet) ->
        Map.update(pet, :shelter, nil, fn(shelter) ->
          Map.update(shelter || %{}, :region, nil, &(Map.delete(&1 || %{}, :shelters)))
        end)
      end)
    |> Repo.preload(:species)

     nbQuery = from p in Pet,
     join: sp in assoc(p, :species),
     join: ra in assoc(p, :race),
     join: sh in assoc(p, :shelter),
     join: re in assoc(sh, :region),
     where: like(fragment("to_char(?, 'FM999999999999')", sp.id), ^species)
            and like(fragment("to_char(?, 'FM999999999999')", ra.id), ^race)
            and like(fragment("to_char(?, 'FM999999999999')", re.id), ^region)
     petNb = Repo.aggregate(nbQuery, :count, :id)

    render(conn, "index.json", pets: pets, count: petNb)
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
