defmodule FindAFluff.PetController do
  use FindAFluff.Web, :controller

  alias FindAFluff.Pet

  def index(conn, params) do
    offset_value = Dict.get(params, "offset", 0)
    species = Dict.get(params, "species", "%")
    race = Dict.get(params, "race", "%")
    region = Dict.get(params, "region", "%")
    photo = Dict.get(params, "photo", nil)
    age = Dict.get(params, "age", nil)
    query = from p in Pet,
     join: sh in assoc(p, :shelter),
     join: re in assoc(sh, :region),
     where: like(fragment("coalesce(to_char(?, 'FM999999999999'), '')", p.species_id), ^species)
            and like(fragment("coalesce(to_char(?, 'FM999999999999'), '')", p.race_id), ^race)
            and like(fragment("coalesce(to_char(?, 'FM999999999999'), '')", re.id), ^region)
     if photo == "true" do
       query = query
        |> where([p], p.img_url != "")
     end
     if age do
       {age, _} = Integer.parse(age)
       query = query
        |> where([p], p.birthdate > ago(^age, "year"))
     end
     fullQuery = query
     |> order_by([p], desc: p.img_url, desc: p.id)
     |> limit(12)
     |> offset(^offset_value)

    pets = Repo.all(fullQuery)
    |> Repo.preload(:race)
    |> Repo.preload(shelter: :region)
    |> Enum.map(fn(pet) ->
        Map.update(pet, :shelter, nil, fn(shelter) ->
          Map.update(shelter || %{}, :region, nil, &(Map.delete(&1 || %{}, :shelters)))
        end)
      end)
    |> Repo.preload(:species)
    
     petNb = Repo.aggregate(query, :count, :id)

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
