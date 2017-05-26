defmodule Phgeox.Dipartimento do
  @moduledoc """
  The boundary for the Dipartimento system.
  """

  import Ecto.{Query, Changeset}, warn: false
  alias Phgeox.Repo

  alias Phgeox.Dipartimento.Utente

  @doc """
  Returns the list of utenti.

  ## Examples

      iex> list_utenti()
      [%Utente{}, ...]

  """
  def list_utenti do
    Repo.all(Utente)
  end

  @doc """
  Gets a single utente.

  Raises `Ecto.NoResultsError` if the Utente does not exist.

  ## Examples

      iex> get_utente!(123)
      %Utente{}

      iex> get_utente!(456)
      ** (Ecto.NoResultsError)

  """
  def get_utente!(id), do: Repo.get!(Utente, id)

  @doc """
  Creates a utente.

  ## Examples

      iex> create_utente(%{field: value})
      {:ok, %Utente{}}

      iex> create_utente(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_utente(attrs \\ %{}) do
    %Utente{}
    |> utente_changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a utente.

  ## Examples

      iex> update_utente(utente, %{field: new_value})
      {:ok, %Utente{}}

      iex> update_utente(utente, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_utente(%Utente{} = utente, attrs) do
    utente
    |> utente_changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Utente.

  ## Examples

      iex> delete_utente(utente)
      {:ok, %Utente{}}

      iex> delete_utente(utente)
      {:error, %Ecto.Changeset{}}

  """
  def delete_utente(%Utente{} = utente) do
    Repo.delete(utente)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking utente changes.

  ## Examples

      iex> change_utente(utente)
      %Ecto.Changeset{source: %Utente{}}

  """
  def change_utente(%Utente{} = utente) do
    utente_changeset(utente, %{})
  end

  defp utente_changeset(%Utente{} = utente, attrs) do
    utente
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
