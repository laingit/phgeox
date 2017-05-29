defmodule Phgeox.Utility.Colori do

    def hex(valore) when is_integer(valore) do
        Integer.to_string(valore,16) |> String.pad_leading(2, ["0"])
    end

    def hex(valore) when is_binary(valore) do
        String.to_integer(valore) |> hex
    end 

    def rgb_to_hex(%{red: red, green: green , blue: blue}) do
        "##{hex red}#{hex green}#{hex blue}"
    end
   
end
