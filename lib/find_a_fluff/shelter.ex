defmodule FindAFluff.Shelter do
  use Ecto.Schema
  import Ecto.Changeset
  
  @derive {Poison.Encoder, only: [:name, :region]}
  schema "shelters" do
    field :name, :string
    has_many :pets, FindAFluff.Pet
    belongs_to :region, FindAFluff.Region

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
  end
end
