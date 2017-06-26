defmodule Phgeox.Web.Lito_001View do
  use Phgeox.Web, :view

  # Utilita
  def tassello(%{red: _, green: _, blue: _, liv_2: liv_2}=colore) do
    hex_color = Phgeox.Utility.Colori.rgb_to_hex(colore)
    {:safe, 
    """
    <div style="padding:3px; border:solid black 1px;width:50px; height:25px; background-color:#{hex_color};">#{liv_2}</div>
    """}
  end
end
