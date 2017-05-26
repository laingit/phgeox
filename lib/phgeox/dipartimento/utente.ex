defmodule Phgeox.Dipartimento.Utente do
  use Ecto.Schema

  schema "dipartimento_utenti" do
    field :name, :string

    timestamps()
  end
end
