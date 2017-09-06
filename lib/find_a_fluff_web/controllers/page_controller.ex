defmodule FindAFluffWeb.PageController do
  use FindAFluffWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
