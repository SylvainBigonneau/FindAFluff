defmodule FindAFluff.Repo.Migrations.ChangeTattooField do
  use Ecto.Migration

  def change do
    alter table(:pets) do
      add :tattoo, :string
      remove :tattooed
    end
  end
end
