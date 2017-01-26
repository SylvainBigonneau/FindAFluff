defmodule FindAFluff.Repo.Migrations.CreateRegion do
  use Ecto.Migration

  def change do
    create table(:regions) do
      add :name, :string

      timestamps()
    end

  end
end
