defmodule Phgeox.Web.MLito_001ControllerTest do
  use Phgeox.Web.ConnCase

  alias Phgeox.Legende

  @create_attrs %{blue: 42, green: 42, liv_0: "some liv_0", liv_0_desc: "some liv_0_desc", liv_1: "some liv_1", liv_1_desc: "some liv_1_desc", red: 42}
  @update_attrs %{blue: 43, green: 43, liv_0: "some updated liv_0", liv_0_desc: "some updated liv_0_desc", liv_1: "some updated liv_1", liv_1_desc: "some updated liv_1_desc", red: 43}
  @invalid_attrs %{blue: nil, green: nil, liv_0: nil, liv_0_desc: nil, liv_1: nil, liv_1_desc: nil, red: nil}

  def fixture(:m_lito_001) do
    {:ok, m_lito_001} = Legende.create_m_lito_001(@create_attrs)
    m_lito_001
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, m_lito_001_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing Mlito 001"
  end

  test "renders form for new mlito_001", %{conn: conn} do
    conn = get conn, m_lito_001_path(conn, :new)
    assert html_response(conn, 200) =~ "New M lito 001"
  end

  test "creates m_lito_001 and redirects to show when data is valid", %{conn: conn} do
    conn = post conn, m_lito_001_path(conn, :create), m_lito_001: @create_attrs

    assert %{id: id} = redirected_params(conn)
    assert redirected_to(conn) == m_lito_001_path(conn, :show, id)

    conn = get conn, m_lito_001_path(conn, :show, id)
    assert html_response(conn, 200) =~ "Show M lito 001"
  end

  test "does not create m_lito_001 and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, m_lito_001_path(conn, :create), m_lito_001: @invalid_attrs
    assert html_response(conn, 200) =~ "New M lito 001"
  end

  test "renders form for editing chosen m_lito_001", %{conn: conn} do
    m_lito_001 = fixture(:m_lito_001)
    conn = get conn, m_lito_001_path(conn, :edit, m_lito_001)
    assert html_response(conn, 200) =~ "Edit M lito 001"
  end

  test "updates chosen m_lito_001 and redirects when data is valid", %{conn: conn} do
    m_lito_001 = fixture(:m_lito_001)
    conn = put conn, m_lito_001_path(conn, :update, m_lito_001), m_lito_001: @update_attrs
    assert redirected_to(conn) == m_lito_001_path(conn, :show, m_lito_001)

    conn = get conn, m_lito_001_path(conn, :show, m_lito_001)
    assert html_response(conn, 200) =~ "some updated liv_0"
  end

  test "does not update chosen m_lito_001 and renders errors when data is invalid", %{conn: conn} do
    m_lito_001 = fixture(:m_lito_001)
    conn = put conn, m_lito_001_path(conn, :update, m_lito_001), m_lito_001: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit M lito 001"
  end

  test "deletes chosen m_lito_001", %{conn: conn} do
    m_lito_001 = fixture(:m_lito_001)
    conn = delete conn, m_lito_001_path(conn, :delete, m_lito_001)
    assert redirected_to(conn) == m_lito_001_path(conn, :index)
    assert_error_sent 404, fn ->
      get conn, m_lito_001_path(conn, :show, m_lito_001)
    end
  end
end
