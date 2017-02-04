defmodule FindAFluff.RegionController do
  use FindAFluff.Web, :controller

  alias FindAFluff.Region

  def index(conn, params) do

    species = Dict.get(params, "species", "%")
    race = Dict.get(params, "race", "%")
    photo = Dict.get(params, "photo", nil)

   query = from r in Region,
     join: sh in assoc(r, :shelters),
     join: p in assoc(sh, :pets),
     join: sp in assoc(p, :species),
     join: ra in assoc(p, :race),
     where: like(fragment("to_char(?, 'FM999999999999')", sp.id), ^species)
            and like(fragment("to_char(?, 'FM999999999999')", ra.id), ^race)
            
    if photo == "true" do
       query = query
        |> where([r, sh, p], p.img_url != "")
     end
     query = query
     |> group_by([r], r.id)
     |> select([r, sh, p], %{id: r.id, name: r.name, pet_count: count(p.id)})


    regions = Repo.all(query)

    render(conn, "index.json", regions: regions)
  end

end
