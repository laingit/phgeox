defmodule Phgeox.Legende do
  @moduledoc """
  The boundary for the Legende system.
  """

  import Ecto.{Query, Changeset}, warn: false
  alias Phgeox.Repo

  alias Phgeox.Legende.Lito_001

  @doc """
  Returns the list of lito_001.

  ## Examples

      iex> list_lito_001()
      [%Lito_001{}, ...]

  """
  def list_lito_001 do
    Repo.all(Lito_001)
  end

  @doc """
  Gets a single lito_001.

  Raises `Ecto.NoResultsError` if the Lito 001 does not exist.

  ## Examples

      iex> get_lito_001!(123)
      %Lito_001{}

      iex> get_lito_001!(456)
      ** (Ecto.NoResultsError)

  """
  def get_lito_001!(id), do: Repo.get!(Lito_001, id)

  @doc """
  Creates a lito_001.

  ## Examples

      iex> create_lito_001(%{field: value})
      {:ok, %Lito_001{}}

      iex> create_lito_001(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_lito_001(attrs \\ %{}) do
    %Lito_001{}
    |> lito_001_changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a lito_001.

  ## Examples

      iex> update_lito_001(lito_001, %{field: new_value})
      {:ok, %Lito_001{}}

      iex> update_lito_001(lito_001, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_lito_001(%Lito_001{} = lito_001, attrs) do
    lito_001
    |> lito_001_changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Lito_001.

  ## Examples

      iex> delete_lito_001(lito_001)
      {:ok, %Lito_001{}}

      iex> delete_lito_001(lito_001)
      {:error, %Ecto.Changeset{}}

  """
  def delete_lito_001(%Lito_001{} = lito_001) do
    Repo.delete(lito_001)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking lito_001 changes.

  ## Examples

      iex> change_lito_001(lito_001)
      %Ecto.Changeset{source: %Lito_001{}}

  """
  def change_lito_001(%Lito_001{} = lito_001) do
    lito_001_changeset(lito_001, %{})
  end

  defp lito_001_changeset(%Lito_001{} = lito_001, attrs) do
    lito_001
    |> cast(attrs, [:liv_0, :liv_0_desc, :liv_1, :liv_1_desc, :liv_2, :liv_2_desc, :red, :green, :blue])
    |> validate_required([:liv_0, :liv_0_desc, :liv_1, :liv_1_desc, :liv_2, :liv_2_desc, :red, :green, :blue])
  end
end
