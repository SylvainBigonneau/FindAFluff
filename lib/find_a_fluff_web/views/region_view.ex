defmodule FindAFluffWeb.RegionView do
  use FindAFluffWeb, :view

  def render("index.json", %{regions: regions}) do
    %{data: render_many(regions, FindAFluffWeb.RegionView, "region.json")}
  end

  def render("region.json", %{region: region}) do
    %{id: region.id,
      name: region.name,
      pet_count: region.pet_count}
  end
end
