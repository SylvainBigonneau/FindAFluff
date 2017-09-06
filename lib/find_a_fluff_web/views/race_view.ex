defmodule FindAFluffWeb.RaceView do
  use FindAFluffWeb, :view

  def render("index.json", %{races: races}) do
    %{data: render_many(races, FindAFluffWeb.RaceView, "race.json")}
  end

  def render("race.json", %{race: race}) do
    %{id: race.id,
      name: race.name,
      pet_count: race.pet_count}
  end
end
