defmodule Phgeox.Repo.Migrations.CreatePhgeox.Legende.MLito_001 do
  use Ecto.Migration

  def change do
    create table(:legende_mlito_001) do
      add :liv_0, :string
      add :liv_0_desc, :string
      add :liv_1, :string
      add :liv_1_desc, :string
      add :red, :integer
      add :green, :integer
      add :blue, :integer

    end

  end
end
