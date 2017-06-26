defmodule Phgeox.Web.MLito_001Controller do
  use Phgeox.Web, :controller

  alias Phgeox.Legende

  def index(conn, _params) do
    mlito_001 = Legende.list_mlito_001()
    render(conn, "index.html", mlito_001: mlito_001)
  end

  def new(conn, _params) do
    changeset = Legende.change_m_lito_001(%Phgeox.Legende.MLito_001{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"m_lito_001" => m_lito_001_params}) do
    case Legende.create_m_lito_001(m_lito_001_params) do
      {:ok, m_lito_001} ->
        conn
        |> put_flash(:info, "M lito 001 created successfully.")
        |> redirect(to: m_lito_001_path(conn, :show, m_lito_001))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    m_lito_001 = Legende.get_m_lito_001!(id)
    render(conn, "show.html", m_lito_001: m_lito_001)
  end

  def edit(conn, %{"id" => id}) do
    m_lito_001 = Legende.get_m_lito_001!(id)
    changeset = Legende.change_m_lito_001(m_lito_001)
    render(conn, "edit.html", m_lito_001: m_lito_001, changeset: changeset)
  end

  def update(conn, %{"id" => id, "m_lito_001" => m_lito_001_params}) do
    m_lito_001 = Legende.get_m_lito_001!(id)

    case Legende.update_m_lito_001(m_lito_001, m_lito_001_params) do
      {:ok, m_lito_001} ->
        conn
        |> put_flash(:info, "M lito 001 updated successfully.")
        |> redirect(to: m_lito_001_path(conn, :show, m_lito_001))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", m_lito_001: m_lito_001, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    m_lito_001 = Legende.get_m_lito_001!(id)
    {:ok, _m_lito_001} = Legende.delete_m_lito_001(m_lito_001)

    conn
    |> put_flash(:info, "M lito 001 deleted successfully.")
    |> redirect(to: m_lito_001_path(conn, :index))
  end
end
