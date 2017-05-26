defmodule Phgeox.Web.UtenteControllerTest do
  use Phgeox.Web.ConnCase

  alias Phgeox.Dipartimento

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  def fixture(:utente) do
    {:ok, utente} = Dipartimento.create_utente(@create_attrs)
    utente
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, utente_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing Utenti"
  end

  test "renders form for new utenti", %{conn: conn} do
    conn = get conn, utente_path(conn, :new)
    assert html_response(conn, 200) =~ "New Utente"
  end

  test "creates utente and redirects to show when data is valid", %{conn: conn} do
    conn = post conn, utente_path(conn, :create), utente: @create_attrs

    assert %{id: id} = redirected_params(conn)
    assert redirected_to(conn) == utente_path(conn, :show, id)

    conn = get conn, utente_path(conn, :show, id)
    assert html_response(conn, 200) =~ "Show Utente"
  end

  test "does not create utente and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, utente_path(conn, :create), utente: @invalid_attrs
    assert html_response(conn, 200) =~ "New Utente"
  end

  test "renders form for editing chosen utente", %{conn: conn} do
    utente = fixture(:utente)
    conn = get conn, utente_path(conn, :edit, utente)
    assert html_response(conn, 200) =~ "Edit Utente"
  end

  test "updates chosen utente and redirects when data is valid", %{conn: conn} do
    utente = fixture(:utente)
    conn = put conn, utente_path(conn, :update, utente), utente: @update_attrs
    assert redirected_to(conn) == utente_path(conn, :show, utente)

    conn = get conn, utente_path(conn, :show, utente)
    assert html_response(conn, 200) =~ "some updated name"
  end

  test "does not update chosen utente and renders errors when data is invalid", %{conn: conn} do
    utente = fixture(:utente)
    conn = put conn, utente_path(conn, :update, utente), utente: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit Utente"
  end

  test "deletes chosen utente", %{conn: conn} do
    utente = fixture(:utente)
    conn = delete conn, utente_path(conn, :delete, utente)
    assert redirected_to(conn) == utente_path(conn, :index)
    assert_error_sent 404, fn ->
      get conn, utente_path(conn, :show, utente)
    end
  end
end
