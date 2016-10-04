defmodule Harvey.RealmController do
  use Harvey.Web, :controller

  alias Harvey.Realm

  def index(conn, _params) do
    realms = Repo.all(Realm)
    render(conn, "index.html", realms: realms)
  end

  def new(conn, _params) do
    changeset = Realm.changeset(%Realm{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"realm" => realm_params}) do
    changeset = Realm.changeset(%Realm{}, realm_params)

    case Repo.insert(changeset) do
      {:ok, _realm} ->
        conn
        |> put_flash(:info, "Realm created successfully.")
        |> redirect(to: realm_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    realm = Repo.get!(Realm, id)
    render(conn, "show.html", realm: realm)
  end

  def edit(conn, %{"id" => id}) do
    realm = Repo.get!(Realm, id)
    changeset = Realm.changeset(realm)
    render(conn, "edit.html", realm: realm, changeset: changeset)
  end

  def update(conn, %{"id" => id, "realm" => realm_params}) do
    realm = Repo.get!(Realm, id)
    changeset = Realm.changeset(realm, realm_params)

    case Repo.update(changeset) do
      {:ok, realm} ->
        conn
        |> put_flash(:info, "Realm updated successfully.")
        |> redirect(to: realm_path(conn, :show, realm))
      {:error, changeset} ->
        render(conn, "edit.html", realm: realm, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    realm = Repo.get!(Realm, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(realm)

    conn
    |> put_flash(:info, "Realm deleted successfully.")
    |> redirect(to: realm_path(conn, :index))
  end
end
