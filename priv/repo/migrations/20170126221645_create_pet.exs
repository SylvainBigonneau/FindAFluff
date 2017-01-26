defmodule FindAFluff.Repo.Migrations.CreatePet do
  use Ecto.Migration

  def change do
    create table(:pets) do
      add :name, :string
      add :gender, :string
      add :birthdate, :date
      add :img_url, :string
      add :neutered, :boolean, default: false, null: false
      add :tattooed, :boolean, default: false, null: false
      add :link, :string
      add :species_id, references(:species, on_delete: :nothing)
      add :shelter_id, references(:shelters, on_delete: :nothing)
      add :race_id, references(:races, on_delete: :nothing)

      timestamps()
    end
    create index(:pets, [:species_id])
    create index(:pets, [:shelter_id])
    create index(:pets, [:race_id])

  end
end
