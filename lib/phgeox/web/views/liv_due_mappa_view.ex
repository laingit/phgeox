defmodule Phgeox.Web.Liv_due_mappaView do
  use Phgeox.Web, :view

  def render("index.json", %{liv_due_mappa: liv_due_mappa}) do
    %{data: liv_due_mappa}
  end
 
end