defmodule FindAFluff.Repo.Migrations.CreateShelter do
  use Ecto.Migration

  def change do
    create table(:shelters) do
      add :name, :string
      add :region_id, references(:regions, on_delete: :nothing)

      timestamps()
    end
    create index(:shelters, [:region_id])

  end
end
