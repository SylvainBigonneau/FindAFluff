defmodule FindAFluff.Repo.Migrations.NullNeutered do
  use Ecto.Migration

  def change do
    alter table(:pets) do
      modify :neutered, :boolean, null: true
    end
  end
end
