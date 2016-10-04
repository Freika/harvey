defmodule Harvey.Repo.Migrations.AddSlugToRealm do
  use Ecto.Migration

  def change do
    alter table(:realms) do
      add :slug, :string
    end
  end
end
