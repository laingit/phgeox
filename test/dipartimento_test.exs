defmodule Phgeox.DipartimentoTest do
  use Phgeox.DataCase

  alias Phgeox.Dipartimento
  alias Phgeox.Dipartimento.Utente

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  def fixture(:utente, attrs \\ @create_attrs) do
    {:ok, utente} = Dipartimento.create_utente(attrs)
    utente
  end

  test "list_utenti/1 returns all utenti" do
    utente = fixture(:utente)
    assert Dipartimento.list_utenti() == [utente]
  end

  test "get_utente! returns the utente with given id" do
    utente = fixture(:utente)
    assert Dipartimento.get_utente!(utente.id) == utente
  end

  test "create_utente/1 with valid data creates a utente" do
    assert {:ok, %Utente{} = utente} = Dipartimento.create_utente(@create_attrs)
    assert utente.name == "some name"
  end

  test "create_utente/1 with invalid data returns error changeset" do
    assert {:error, %Ecto.Changeset{}} = Dipartimento.create_utente(@invalid_attrs)
  end

  test "update_utente/2 with valid data updates the utente" do
    utente = fixture(:utente)
    assert {:ok, utente} = Dipartimento.update_utente(utente, @update_attrs)
    assert %Utente{} = utente
    assert utente.name == "some updated name"
  end

  test "update_utente/2 with invalid data returns error changeset" do
    utente = fixture(:utente)
    assert {:error, %Ecto.Changeset{}} = Dipartimento.update_utente(utente, @invalid_attrs)
    assert utente == Dipartimento.get_utente!(utente.id)
  end

  test "delete_utente/1 deletes the utente" do
    utente = fixture(:utente)
    assert {:ok, %Utente{}} = Dipartimento.delete_utente(utente)
    assert_raise Ecto.NoResultsError, fn -> Dipartimento.get_utente!(utente.id) end
  end

  test "change_utente/1 returns a utente changeset" do
    utente = fixture(:utente)
    assert %Ecto.Changeset{} = Dipartimento.change_utente(utente)
  end
end
