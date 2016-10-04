defmodule Harvey.RealmTest do
  use Harvey.ModelCase

  alias Harvey.Realm

  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Realm.changeset(%Realm{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Realm.changeset(%Realm{}, @invalid_attrs)
    refute changeset.valid?
  end
end
