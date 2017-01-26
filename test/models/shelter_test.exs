defmodule FindAFluff.ShelterTest do
  use FindAFluff.ModelCase

  alias FindAFluff.Shelter

  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Shelter.changeset(%Shelter{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Shelter.changeset(%Shelter{}, @invalid_attrs)
    refute changeset.valid?
  end
end
