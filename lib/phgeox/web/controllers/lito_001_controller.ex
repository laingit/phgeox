defmodule Phgeox.Web.Lito_001Controller do
  use Phgeox.Web, :controller

  alias Phgeox.Legende

  def index(conn, _params) do
    lito_001 = Legende.list_lito_001()
    render(conn, "index.html", lito_001: lito_001)
  end

  def new(conn, _params) do
    changeset = Legende.change_lito_001(%Phgeox.Legende.Lito_001{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"lito_001" => lito_001_params}) do
    case Legende.create_lito_001(lito_001_params) do
      {:ok, lito_001} ->
        conn
        |> put_flash(:info, "Lito 001 created successfully.")
        |> redirect(to: lito_001_path(conn, :show, lito_001))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    lito_001 = Legende.get_lito_001!(id)
    render(conn, "show.html", lito_001: lito_001)
  end

  def edit(conn, %{"id" => id}) do
    lito_001 = Legende.get_lito_001!(id)
    changeset = Legende.change_lito_001(lito_001)
    render(conn, "edit.html", lito_001: lito_001, changeset: changeset)
  end

  def update(conn, %{"id" => id, "lito_001" => lito_001_params}) do
    lito_001 = Legende.get_lito_001!(id)

    case Legende.update_lito_001(lito_001, lito_001_params) do
      {:ok, lito_001} ->
        conn
        |> put_flash(:info, "Lito 001 updated successfully.")
        |> redirect(to: lito_001_path(conn, :show, lito_001))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", lito_001: lito_001, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    lito_001 = Legende.get_lito_001!(id)
    {:ok, _lito_001} = Legende.delete_lito_001(lito_001)

    conn
    |> put_flash(:info, "Lito 001 deleted successfully.")
    |> redirect(to: lito_001_path(conn, :index))
  end
end
