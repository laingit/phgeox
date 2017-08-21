defmodule Phgeox.Web.Liv_due_mappaController do
  use Phgeox.Web, :controller

  alias Phgeox.Legende

  def index(conn, params) do
    bound = Legende.get_default_bound_if_not_present(params)
    liv_due_mappa = Legende.list_liv_due_mappa(bound)
    render(conn, "index.json", liv_due_mappa: liv_due_mappa)
  end
  
end