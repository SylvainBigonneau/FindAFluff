defmodule FindAFluff.Repo.Migrations.AddRaceDetails do
  use Ecto.Migration

  def change do
    alter table(:pets) do
      add :race_details, :string
    end
  end
end
