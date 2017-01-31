defmodule FindAFluff.Race do
  use FindAFluff.Web, :model

  @derive {Poison.Encoder, only: [:id, :name]}
  schema "races" do
    field :name, :string
    belongs_to :species, FindAFluff.Species

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
