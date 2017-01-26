defmodule FindAFluff.PetTest do
  use FindAFluff.ModelCase

  alias FindAFluff.Pet

  @valid_attrs %{birthdate: %{day: 17, month: 4, year: 2010}, gender: "some content", img_url: "some content", link: "some content", name: "some content", neutered: true, tattooed: true}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Pet.changeset(%Pet{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Pet.changeset(%Pet{}, @invalid_attrs)
    refute changeset.valid?
  end
end
