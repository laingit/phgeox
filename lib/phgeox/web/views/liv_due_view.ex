defmodule Phgeox.Web.Liv_dueView do
  use Phgeox.Web, :view

  def render("index.json", %{liv_due: liv_due}) do
    %{data: render_many(liv_due, Phgeox.Web.Liv_dueView, "liv_due.json")}
  end
 
  def render("gerarchia.json", %{liv_due: liv_due}) do
    %{data: liv_due}
  end

  def render("liv_due.json", %{liv_due: liv_due}) do
    %{id: liv_due.liv_2,
      desc: liv_due.liv_2_desc,
      rgb: Phgeox.Utility.Colori.rgb_to_hex(liv_due)}
  end
end