defmodule Harvey.PageController do
  use Harvey.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
