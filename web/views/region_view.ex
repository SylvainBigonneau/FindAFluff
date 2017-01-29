defmodule FindAFluff.RegionView do
  use FindAFluff.Web, :view

  def render("index.json", %{regions: regions}) do
    %{data: render_many(regions, FindAFluff.RegionView, "region.json")}
  end

  def render("region.json", %{region: region}) do
    %{id: region.id,
      name: region.name}
  end
end
