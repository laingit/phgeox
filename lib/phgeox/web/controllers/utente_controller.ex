defmodule Phgeox.Web.UtenteController do
  use Phgeox.Web, :controller

  alias Phgeox.Dipartimento

  def index(conn, _params) do
    utenti = Dipartimento.list_utenti()
    render(conn, "index.html", utenti: utenti)
  end

  def new(conn, _params) do
    changeset = Dipartimento.change_utente(%Phgeox.Dipartimento.Utente{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"utente" => utente_params}) do
    case Dipartimento.create_utente(utente_params) do
      {:ok, utente} ->
        conn
        |> put_flash(:info, "Utente created successfully.")
        |> redirect(to: utente_path(conn, :show, utente))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    utente = Dipartimento.get_utente!(id)
    render(conn, "show.html", utente: utente)
  end

  def edit(conn, %{"id" => id}) do
    utente = Dipartimento.get_utente!(id)
    changeset = Dipartimento.change_utente(utente)
    render(conn, "edit.html", utente: utente, changeset: changeset)
  end

  def update(conn, %{"id" => id, "utente" => utente_params}) do
    utente = Dipartimento.get_utente!(id)

    case Dipartimento.update_utente(utente, utente_params) do
      {:ok, utente} ->
        conn
        |> put_flash(:info, "Utente updated successfully.")
        |> redirect(to: utente_path(conn, :show, utente))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", utente: utente, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    utente = Dipartimento.get_utente!(id)
    {:ok, _utente} = Dipartimento.delete_utente(utente)

    conn
    |> put_flash(:info, "Utente deleted successfully.")
    |> redirect(to: utente_path(conn, :index))
  end
end
