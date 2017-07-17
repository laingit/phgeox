defmodule Phgeox.Sld do

  alias Phgeox.Legende
  
  def writeLegendaLiv_UNO do
    nomeFile = "/db-alai-dev/Litologica2017_UNO_v001.sld"
    litologia = Legende.list_mlito_001
    lista = litologia |> Enum.map(&mappa_litologia_liv_1/1)
    
    stringa = componiSLD lista
    write nomeFile, stringa
  end

  def writeLegendaLiv_DUE do
    nomeFile = "/db-alai-dev/Litologica2017_DUE_v001.sld"
    litologia = Legende.list_lito_001
    lista = litologia |> Enum.map(&mappa_litologia_liv_2/1)
    
    stringa = componiSLD lista
    write nomeFile, stringa
  end

  def writeRgb_Liv_UNO do
    nomeFile = "/db-alai-dev/Litologica_rgb_UNO_v001.txt"
    litologia = Legende.list_mlito_001
    lista = litologia |> Enum.map(fn m ->  "#{m.liv_1};#{Phgeox.Utility.Colori.rgb_to_hex(m)}\n"  end)
    
    stringa = List.foldl(lista, "", fn (v, acc) -> acc <> v end)
    write nomeFile, stringa
  end

  def writeRgb_Liv_DUE do
    nomeFile = "/db-alai-dev/Litologica_rgb_DUE_v001.txt"
    litologia = Legende.list_lito_001
    lista = litologia |> Enum.map(fn m ->  "#{m.liv_2};#{Phgeox.Utility.Colori.rgb_to_hex(m)}\n"  end)
    
    stringa = List.foldl(lista, "", fn (v, acc) -> acc <> v end)
    write nomeFile, stringa
  end
  
  defp write(nomeFile, stringa) do
    
    # nomeFile = "/db-alai-dev/Litologica2017_liv1_v001.sld"
    IO.puts "writing:" <> nomeFile

    {:ok, file} = File.open nomeFile, [:write]
    IO.binwrite file, stringa
    File.close file
  end

  defp start do 
    """
    <?xml version="1.0" encoding="utf-8"?>
    <StyledLayerDescriptor xmlns:ogc="http://www.opengis.net/ogc" version="1.0.0" xmlns="http://www.opengis.net/sld">
    <NamedLayer>
      <Name>Carta Litologica della Sardegna - scala riferimento 1:25.000</Name>
      <UserStyle>
        <FeatureTypeStyle>
    """
  end

  defp fine do 
    """
          <Rule>
            <Name>Tutti i poligoni</Name>
            <Title>Bordo</Title>
            <PolygonSymbolizer>
              <Stroke>
                <CssParameter name="stroke">#0000ff</CssParameter>
                <CssParameter name="stroke-width">0.05</CssParameter>
              </Stroke>
            </PolygonSymbolizer>
          </Rule>
          </FeatureTypeStyle>
        </UserStyle>
      </NamedLayer>
    </StyledLayerDescriptor>
    """
  end

  defp componi(%{name: name, title: title, propertyName: propertyName, valore: valore, rgb: rgb}) do
    """
        <Rule>
          <Name>#{name}</Name>
          <Title>#{title}</Title>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>#{propertyName}</ogc:PropertyName>
              <ogc:Literal>#{valore}</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <PolygonSymbolizer>
            <Fill>
              <CssParameter name="fill">#{rgb}</CssParameter>
            </Fill>
          </PolygonSymbolizer>
        </Rule>
    """
  end

  defp mappa_litologia_liv_1(m) do 
     %{name: m.liv_1, title: m.liv_1 <> " - " <> m.liv_1_desc, propertyName: "LIV_1",
           valore: m.liv_1, rgb: Phgeox.Utility.Colori.rgb_to_hex(m)}
  end

  defp mappa_litologia_liv_2(m) do 
     %{name: m.liv_2, title: m.liv_2 <> " - " <> m.liv_2_desc, propertyName: "LIV_2",
           valore: m.liv_2, rgb: Phgeox.Utility.Colori.rgb_to_hex(m)}
  end
  

  # r = componi %{name: "My Name A.1", title: "My title A.1", propertyName: "LIV_2", valore: "A.1", rgb: "#ff0000"}
  defp componiSLD(lista) do
    start() <> List.foldl(lista, "", fn (v, acc) -> acc <> componi(v) end) <> fine()
  end

end
