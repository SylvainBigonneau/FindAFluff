defmodule FindAFluff.Species do
  use Ecto.Schema
  import Ecto.Changeset
  
  @derive {Poison.Encoder, only: [:id, :name]}
  schema "species" do
    field :name, :string
    has_many :pets, FindAFluff.Pet
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
