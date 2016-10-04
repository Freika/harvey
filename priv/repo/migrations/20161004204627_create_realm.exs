defmodule Harvey.Repo.Migrations.CreateRealm do
  use Ecto.Migration

  def change do
    create table(:realms) do
      add :name, :string

      timestamps()
    end

  end
end
