defmodule FindAFluffWeb.SpeciesController do
  use FindAFluffWeb, :controller

  alias FindAFluff.Species

  def index(conn, params) do

    region = Dict.get(params, "region", "%")
    photo = Dict.get(params, "photo", nil)
    age = Dict.get(params, "age", nil)

    query = from s in Species,
     join: p in assoc(s, :pets),
     join: sh in assoc(p, :shelter),
     join: r in assoc(sh, :region),
     where: like(fragment("to_char(?, 'FM999999999999')", r.id), ^region)
     if age do
       {age, _} = Integer.parse(age)
       query = query
        |> where([s, p], p.birthdate > ago(^age, "year"))
     end     
     if photo == "true" do
       query = query
        |> where([s, p], p.img_url != "")
     end
     query = query
     |> group_by([s], s.id)
     |> select([s, p], %{id: s.id, name: s.name, pet_count: count(p.id)})

    species = Repo.all(query)

    render(conn, "index.json", species: species)
  end

end
