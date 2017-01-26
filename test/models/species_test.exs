defmodule FindAFluff.SpeciesTest do
  use FindAFluff.ModelCase

  alias FindAFluff.Species

  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Species.changeset(%Species{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Species.changeset(%Species{}, @invalid_attrs)
    refute changeset.valid?
  end
end
