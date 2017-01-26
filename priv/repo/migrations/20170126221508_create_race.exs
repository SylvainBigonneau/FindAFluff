defmodule FindAFluff.Repo.Migrations.CreateRace do
  use Ecto.Migration

  def change do
    create table(:races) do
      add :name, :string
      add :species_id, references(:species, on_delete: :nothing)

      timestamps()
    end
    create index(:races, [:species_id])

  end
end
