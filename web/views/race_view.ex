defmodule FindAFluff.RaceView do
  use FindAFluff.Web, :view

  def render("index.json", %{races: races}) do
    %{data: render_many(races, FindAFluff.RaceView, "race.json")}
  end

  def render("race.json", %{race: race}) do
    %{id: race.id,
      name: race.name,
      pet_count: race.pet_count}
  end
end
