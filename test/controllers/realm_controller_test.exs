defmodule Harvey.RealmControllerTest do
  use Harvey.ConnCase

  alias Harvey.Realm
  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, realm_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing realms"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, realm_path(conn, :new)
    assert html_response(conn, 200) =~ "New realm"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, realm_path(conn, :create), realm: @valid_attrs
    assert redirected_to(conn) == realm_path(conn, :index)
    assert Repo.get_by(Realm, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, realm_path(conn, :create), realm: @invalid_attrs
    assert html_response(conn, 200) =~ "New realm"
  end

  test "shows chosen resource", %{conn: conn} do
    realm = Repo.insert! %Realm{}
    conn = get conn, realm_path(conn, :show, realm)
    assert html_response(conn, 200) =~ "Show realm"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, realm_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    realm = Repo.insert! %Realm{}
    conn = get conn, realm_path(conn, :edit, realm)
    assert html_response(conn, 200) =~ "Edit realm"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    realm = Repo.insert! %Realm{}
    conn = put conn, realm_path(conn, :update, realm), realm: @valid_attrs
    assert redirected_to(conn) == realm_path(conn, :show, realm)
    assert Repo.get_by(Realm, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    realm = Repo.insert! %Realm{}
    conn = put conn, realm_path(conn, :update, realm), realm: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit realm"
  end

  test "deletes chosen resource", %{conn: conn} do
    realm = Repo.insert! %Realm{}
    conn = delete conn, realm_path(conn, :delete, realm)
    assert redirected_to(conn) == realm_path(conn, :index)
    refute Repo.get(Realm, realm.id)
  end
end
