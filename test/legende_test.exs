defmodule Phgeox.LegendeTest do
  use Phgeox.DataCase

  alias Phgeox.Legende
  alias Phgeox.Legende.Lito_001

  @create_attrs %{blue: 42, green: 42, liv_0: "some liv_0", liv_0_desc: "some liv_0_desc", liv_1: "some liv_1", liv_1_desc: "some liv_1_desc", liv_2: "some liv_2", liv_2_desc: "some liv_2_desc", red: 42}
  @update_attrs %{blue: 43, green: 43, liv_0: "some updated liv_0", liv_0_desc: "some updated liv_0_desc", liv_1: "some updated liv_1", liv_1_desc: "some updated liv_1_desc", liv_2: "some updated liv_2", liv_2_desc: "some updated liv_2_desc", red: 43}
  @invalid_attrs %{blue: nil, green: nil, liv_0: nil, liv_0_desc: nil, liv_1: nil, liv_1_desc: nil, liv_2: nil, liv_2_desc: nil, red: nil}

  def fixture(:lito_001, attrs \\ @create_attrs) do
    {:ok, lito_001} = Legende.create_lito_001(attrs)
    lito_001
  end

  test "list_lito_001/1 returns all lito_001" do
    lito_001 = fixture(:lito_001)
    assert Legende.list_lito_001() == [lito_001]
  end

  test "get_lito_001! returns the lito_001 with given id" do
    lito_001 = fixture(:lito_001)
    assert Legende.get_lito_001!(lito_001.id) == lito_001
  end

  test "create_lito_001/1 with valid data creates a lito_001" do
    assert {:ok, %Lito_001{} = lito_001} = Legende.create_lito_001(@create_attrs)
    assert lito_001.blue == 42
    assert lito_001.green == 42
    assert lito_001.liv_0 == "some liv_0"
    assert lito_001.liv_0_desc == "some liv_0_desc"
    assert lito_001.liv_1 == "some liv_1"
    assert lito_001.liv_1_desc == "some liv_1_desc"
    assert lito_001.liv_2 == "some liv_2"
    assert lito_001.liv_2_desc == "some liv_2_desc"
    assert lito_001.red == 42
  end

  test "create_lito_001/1 with invalid data returns error changeset" do
    assert {:error, %Ecto.Changeset{}} = Legende.create_lito_001(@invalid_attrs)
  end

  test "update_lito_001/2 with valid data updates the lito_001" do
    lito_001 = fixture(:lito_001)
    assert {:ok, lito_001} = Legende.update_lito_001(lito_001, @update_attrs)
    assert %Lito_001{} = lito_001
    assert lito_001.blue == 43
    assert lito_001.green == 43
    assert lito_001.liv_0 == "some updated liv_0"
    assert lito_001.liv_0_desc == "some updated liv_0_desc"
    assert lito_001.liv_1 == "some updated liv_1"
    assert lito_001.liv_1_desc == "some updated liv_1_desc"
    assert lito_001.liv_2 == "some updated liv_2"
    assert lito_001.liv_2_desc == "some updated liv_2_desc"
    assert lito_001.red == 43
  end

  test "update_lito_001/2 with invalid data returns error changeset" do
    lito_001 = fixture(:lito_001)
    assert {:error, %Ecto.Changeset{}} = Legende.update_lito_001(lito_001, @invalid_attrs)
    assert lito_001 == Legende.get_lito_001!(lito_001.id)
  end

  test "delete_lito_001/1 deletes the lito_001" do
    lito_001 = fixture(:lito_001)
    assert {:ok, %Lito_001{}} = Legende.delete_lito_001(lito_001)
    assert_raise Ecto.NoResultsError, fn -> Legende.get_lito_001!(lito_001.id) end
  end

  test "change_lito_001/1 returns a lito_001 changeset" do
    lito_001 = fixture(:lito_001)
    assert %Ecto.Changeset{} = Legende.change_lito_001(lito_001)
  end
end
