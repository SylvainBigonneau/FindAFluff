defmodule FindAFluff.RegionController do
  use FindAFluff.Web, :controller

  alias FindAFluff.Region

  def index(conn, _params) do
    regions = Repo.all(Region)
    |> Repo.preload(:shelters)
    |> Enum.map(fn(region) ->
        Map.update(region, :shelters, nil, fn(shelters) ->
            Enum.map(shelters,&(Map.delete(&1 || %{}, :region)))
          end)
      end)

    render(conn, "index.json", regions: regions)
  end

end
