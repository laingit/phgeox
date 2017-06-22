defmodule Phgeox.Sld do
  
  def write(stringa) do
    
    nome = "/db-alai-dev/prova1.sld"
    IO.puts "writing:" <> nome

    {:ok, file} = File.open nome, [:write]
    IO.binwrite file, stringa
    File.close file
  end

  def start do 
    """
    <?xml version="1.0" encoding="utf-8"?>
    <StyledLayerDescriptor xmlns:ogc="http://www.opengis.net/ogc" version="1.0.0" xmlns="http://www.opengis.net/sld">
    <NamedLayer>
      <Name>Carta Litologica della Sardegna - scala riferimento 1:25.000</Name>
      <UserStyle>
        <FeatureTypeStyle>
    """
  end

  def fine do 
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

  def componi(%{name: name, title: title, propertyName: propertyName, valore: valore, rgb: rgb}) do
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

  def mappa_litologia_valori_input_sld(m) do 
     %{name: m.liv_2, title: m.liv_2 <> " - " <> m.liv_2_desc, propertyName: "LIV_2",
           valore: m.liv_2, rgb: Phgeox.Utility.Colori.rgb_to_hex(m)}

  end

  def run(litologia) when is_list(litologia) do
    lista = litologia |> Enum.map(&mappa_litologia_valori_input_sld/1)
    
    # r = componi %{name: "My Name A.1", title: "My title A.1", propertyName: "LIV_2", valore: "A.1", rgb: "#ff0000"}
   

    write start() <> List.foldl(lista, "", fn (v, acc) -> acc <> componi(v) end) <> fine()
  end

end
