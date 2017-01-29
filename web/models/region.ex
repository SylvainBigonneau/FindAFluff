defmodule FindAFluff.Region do
  use FindAFluff.Web, :model

  @derive {Poison.Encoder, only: [:name, :shelters]}
  schema "regions" do
    field :name, :string
    has_many :shelters, FindAFluff.Shelter
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
