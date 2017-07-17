defmodule Phgeox.Web.Liv_dueController do
  use Phgeox.Web, :controller

  alias Phgeox.Legende

  def index(conn, _params) do
    liv_due = Legende.list_lito_001()
    render(conn, "index.json", liv_due: liv_due)
  end
  
end