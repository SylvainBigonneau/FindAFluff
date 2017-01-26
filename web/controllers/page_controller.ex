defmodule FindAFluff.PageController do
  use FindAFluff.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
