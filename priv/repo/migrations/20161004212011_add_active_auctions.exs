defmodule Harvey.Repo.Migrations.AddActiveAuctions do
  use Ecto.Migration

  def change do
    alter table(:realms) do
      add :active_auctons, :integer
    end
  end
end
