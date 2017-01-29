defmodule FindAFluff.RegionController do
  use FindAFluff.Web, :controller

  alias FindAFluff.Region

  def index(conn, _params) do
    regions = Repo.all(Region)
    |> Repo.preload(:shelters)
    render(conn, "index.json", regions: regions)
  end

end
