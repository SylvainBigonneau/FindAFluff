defmodule FindAFluff.Pet do
  use FindAFluff.Web, :model

  schema "pets" do
    field :name, :string
    field :gender, :string
    field :birthdate, Ecto.Date
    field :img_url, :string
    field :neutered, :boolean, default: false
    field :tattoo, :string, default: false
    field :link, :string
    field :race_details, :string
    belongs_to :species, FindAFluff.Species
    belongs_to :shelter, FindAFluff.Shelter
    belongs_to :race, FindAFluff.Race

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :gender, :birthdate, :img_url, :neutered, :tattoo, :link, :race_details])
    |> validate_required([:name, :gender, :birthdate, :img_url, :neutered, :tattoo, :link, :race_details])
  end
end
