defmodule Phgeox.Web.Lito_001ControllerTest do
  use Phgeox.Web.ConnCase

  alias Phgeox.Legende

  @create_attrs %{blue: 42, green: 42, liv_0: "some liv_0", liv_0_desc: "some liv_0_desc", liv_1: "some liv_1", liv_1_desc: "some liv_1_desc", liv_2: "some liv_2", liv_2_desc: "some liv_2_desc", red: 42}
  @update_attrs %{blue: 43, green: 43, liv_0: "some updated liv_0", liv_0_desc: "some updated liv_0_desc", liv_1: "some updated liv_1", liv_1_desc: "some updated liv_1_desc", liv_2: "some updated liv_2", liv_2_desc: "some updated liv_2_desc", red: 43}
  @invalid_attrs %{blue: nil, green: nil, liv_0: nil, liv_0_desc: nil, liv_1: nil, liv_1_desc: nil, liv_2: nil, liv_2_desc: nil, red: nil}

  def fixture(:lito_001) do
    {:ok, lito_001} = Legende.create_lito_001(@create_attrs)
    lito_001
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, lito_001_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing Lito 001"
  end

  test "renders form for new lito_001", %{conn: conn} do
    conn = get conn, lito_001_path(conn, :new)
    assert html_response(conn, 200) =~ "New Lito 001"
  end

  test "creates lito_001 and redirects to show when data is valid", %{conn: conn} do
    conn = post conn, lito_001_path(conn, :create), lito_001: @create_attrs

    assert %{id: id} = redirected_params(conn)
    assert redirected_to(conn) == lito_001_path(conn, :show, id)

    conn = get conn, lito_001_path(conn, :show, id)
    assert html_response(conn, 200) =~ "Show Lito 001"
  end

  test "does not create lito_001 and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, lito_001_path(conn, :create), lito_001: @invalid_attrs
    assert html_response(conn, 200) =~ "New Lito 001"
  end

  test "renders form for editing chosen lito_001", %{conn: conn} do
    lito_001 = fixture(:lito_001)
    conn = get conn, lito_001_path(conn, :edit, lito_001)
    assert html_response(conn, 200) =~ "Edit Lito 001"
  end

  test "updates chosen lito_001 and redirects when data is valid", %{conn: conn} do
    lito_001 = fixture(:lito_001)
    conn = put conn, lito_001_path(conn, :update, lito_001), lito_001: @update_attrs
    assert redirected_to(conn) == lito_001_path(conn, :show, lito_001)

    conn = get conn, lito_001_path(conn, :show, lito_001)
    assert html_response(conn, 200) =~ "some updated liv_0"
  end

  test "does not update chosen lito_001 and renders errors when data is invalid", %{conn: conn} do
    lito_001 = fixture(:lito_001)
    conn = put conn, lito_001_path(conn, :update, lito_001), lito_001: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit Lito 001"
  end

  test "deletes chosen lito_001", %{conn: conn} do
    lito_001 = fixture(:lito_001)
    conn = delete conn, lito_001_path(conn, :delete, lito_001)
    assert redirected_to(conn) == lito_001_path(conn, :index)
    assert_error_sent 404, fn ->
      get conn, lito_001_path(conn, :show, lito_001)
    end
  end
end
