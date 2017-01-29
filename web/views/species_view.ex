defmodule FindAFluff.SpeciesView do
  use FindAFluff.Web, :view

  def render("index.json", %{species: species}) do
    %{data: render_many(species, FindAFluff.SpeciesView, "species.json")}
  end

  def render("species.json", %{species: species}) do
    %{id: species.id,
      name: species.name,
      races: species.races}
  end
end
