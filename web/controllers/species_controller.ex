defmodule FindAFluff.SpeciesController do
  use FindAFluff.Web, :controller

  alias FindAFluff.Species

  def index(conn, _params) do
    species = Repo.all(Species)
    |> Repo.preload(:races)

    render(conn, "index.json", species: species)
  end

end
