defmodule Phgeox.Web.Liv_dueView do
  use Phgeox.Web, :view

  def render("index.json", %{liv_due: liv_due}) do
    %{data: render_many(liv_due, Phgeox.Web.Liv_dueView, "liv_due.json")}
  end
 
  def render("liv_due.json", %{liv_due: liv_due}) do
    %{liv_2: liv_due.liv_2,
      liv_2_desc: liv_due.liv_2_desc,
      rgb: Phgeox.Utility.Colori.rgb_to_hex(liv_due)}
  end
end