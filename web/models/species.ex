defmodule FindAFluff.Species do
  use FindAFluff.Web, :model

  @derive {Poison.Encoder, only: [:id, :name, :races]}
  schema "species" do
    field :name, :string
    has_many :races, FindAFluff.Race
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
