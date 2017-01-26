defmodule FindAFluff.Shelter do
  use FindAFluff.Web, :model

  @derive {Poison.Encoder, only: [:name]}
  schema "shelters" do
    field :name, :string
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
