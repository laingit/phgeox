defmodule Phgeox.Repo.Migrations.CreatePhgeox.Dipartimento.Utente do
  use Ecto.Migration

  def change do
    create table(:dipartimento_utenti) do
      add :name, :string

      timestamps()
    end

  end
end
