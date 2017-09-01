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

  alias Phgeox.Legende.MLito_001

  @doc """
  Returns the list of mlito_001.

  ## Examples

      iex> list_mlito_001()
      [%MLito_001{}, ...]

  """
  def list_mlito_001 do
    Repo.all(MLito_001)
  end

  @doc """
  Gets a single m_lito_001.

  Raises `Ecto.NoResultsError` if the M lito 001 does not exist.

  ## Examples

      iex> get_m_lito_001!(123)
      %MLito_001{}

      iex> get_m_lito_001!(456)
      ** (Ecto.NoResultsError)

  """
  def get_m_lito_001!(id), do: Repo.get!(MLito_001, id)

  @doc """
  Creates a m_lito_001.

  ## Examples

      iex> create_m_lito_001(%{field: value})
      {:ok, %MLito_001{}}

      iex> create_m_lito_001(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_m_lito_001(attrs \\ %{}) do
    %MLito_001{}
    |> m_lito_001_changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a m_lito_001.

  ## Examples

      iex> update_m_lito_001(m_lito_001, %{field: new_value})
      {:ok, %MLito_001{}}

      iex> update_m_lito_001(m_lito_001, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_m_lito_001(%MLito_001{} = m_lito_001, attrs) do
    m_lito_001
    |> m_lito_001_changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a MLito_001.

  ## Examples

      iex> delete_m_lito_001(m_lito_001)
      {:ok, %MLito_001{}}

      iex> delete_m_lito_001(m_lito_001)
      {:error, %Ecto.Changeset{}}

  """
  def delete_m_lito_001(%MLito_001{} = m_lito_001) do
    Repo.delete(m_lito_001)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking m_lito_001 changes.

  ## Examples

      iex> change_m_lito_001(m_lito_001)
      %Ecto.Changeset{source: %MLito_001{}}

  """
  def change_m_lito_001(%MLito_001{} = m_lito_001) do
    m_lito_001_changeset(m_lito_001, %{})
  end

  defp m_lito_001_changeset(%MLito_001{} = m_lito_001, attrs) do
    m_lito_001
    |> cast(attrs, [:liv_0, :liv_0_desc, :liv_1, :liv_1_desc, :red, :green, :blue])
    |> validate_required([:liv_0, :liv_0_desc, :liv_1, :liv_1_desc, :red, :green, :blue])
  end

  

  defp from_ss_atom_integer({k,v}, acc) do
     Map.put  acc, String.to_atom(k), String.to_integer(v)
  end

  def trasforma_in_atom_integer(map) do
    map
    |> Map.to_list
    |> Enum.reduce(%{}, &from_ss_atom_integer/2)
  end

  @xMin 1_400_000
  @xMax 1_600_000
  @yMin 4_200_000
  @yMax 4_600_000

  @doc """
  Relativo alla richiesta delle formazioni del livello due MAPPA
  
  """

  def get_default_bound_if_not_present(map_string_string)do
    params = trasforma_in_atom_integer(map_string_string)
    xMin = Map.get(params, :xMin , @xMin)
    xMax = Map.get(params, :xMax , @xMax)
    yMin = Map.get(params, :yMin , @yMin)
    yMax = Map.get(params, :yMax , @yMax)

    %{xMin: xMin,xMax: xMax, yMin: yMin, yMax: yMax}
  end

  def list_liv_due_mappa(%{xMin: xMin, xMax: xMax, yMin: yMin, yMax: yMax}) do
    {:ok, risposta} = Ecto.Adapters.SQL.query(Phgeox.Repo, "SELECT
        distinct litoduegeobassa.liv_2
      FROM
        public.litoduegeobassa
      WHERE litoduegeobassa.geom &&
      	ST_MakeEnvelope ($1,$2,$3,$4 )
        order by litoduegeobassa.liv_2;", [xMin,yMin,xMax,yMax])
    List.flatten risposta.rows
  end

  ### Per Gerarchia Litologia - INIZIO

  def getLIV_0 do
    query = from lg in "legende_lito_001",
      distinct: lg.liv_0,
      order_by: lg.liv_0,
      select: %{id: lg.liv_0, desc: lg.liv_0_desc, dentro: "root"}

    Repo.all(query)
  end

  def getLIV_1 do
    query = from lg in "legende_lito_001",
      distinct: lg.liv_1,
      order_by: lg.liv_1,
      select: %{id: lg.liv_1, desc: lg.liv_1_desc, dentro: lg.liv_0}

    Repo.all(query)
  end

  defp trasformaGetLIV2(%{id: id, desc: desc, dentro: dentro, rgb: rgb}) do
    %{id: id, desc: desc, dentro: dentro, rgb: Phgeox.Utility.Colori.rgb_to_hex(rgb)}
  end

  def getLIV_2 do
    query = from lg in "legende_lito_001",
      distinct: lg.liv_2,
      order_by: lg.liv_2,
      select: %{id: lg.liv_2, desc: lg.liv_2_desc, dentro: lg.liv_1, rgb: %{red: lg.red, green: lg.green, blue: lg.blue}}

    result = Repo.all(query)
    Enum.map(result, &trasformaGetLIV2/1)
  end

  def listaToObjctKey(%{id: id} = obj, acc) do
    Map.put(acc, id , obj)
  end

  def trasfoLivello2Gerachia do
    liv0 = Enum.reduce(getLIV_0, %{}, &listaToObjctKey/2)
    liv1 = Enum.reduce(getLIV_1, %{}, &listaToObjctKey/2)
    liv2 = Enum.reduce(getLIV_2, %{}, &listaToObjctKey/2)
    %{liv0: liv0, liv1: liv1, liv2: liv2}
  end
end

