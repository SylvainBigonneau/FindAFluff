defmodule FindAFluff.RaceController do
  use FindAFluff.Web, :controller

  alias FindAFluff.Race

  def index(conn, params) do

    region = Dict.get(params, "region", "%")
    species = Dict.get(params, "species", "%")

    query = from r in Race,
     join: p in assoc(r, :pets),
     join: sh in assoc(p, :shelter),
     join: re in assoc(sh, :region),
     join: sp in assoc(p, :species),
     where: like(fragment("to_char(?, 'FM999999999999')", re.id), ^region)
            and like(fragment("to_char(?, 'FM999999999999')", sp.id), ^species),
     group_by: r.id,
     select: %{id: r.id, name: r.name, pet_count: count(p.id)}

    races = Repo.all(query)

    render(conn, "index.json", races: races)
  end

end
