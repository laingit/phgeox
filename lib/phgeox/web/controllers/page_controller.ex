defmodule Phgeox.Web.PageController do
  use Phgeox.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
