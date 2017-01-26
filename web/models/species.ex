defmodule FindAFluff.Species do
  use FindAFluff.Web, :model

  @derive {Poison.Encoder, only: [:name]}
  schema "species" do
    field :name, :string

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
