defmodule FindAFluff.PetControllerTest do
  use FindAFluff.ConnCase

  alias FindAFluff.Pet
  @valid_attrs %{birthdate: %{day: 17, month: 4, year: 2010}, gender: "some content", img_url: "some content", link: "some content", name: "some content", neutered: true, tattooed: true}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, pet_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    pet = Repo.insert! %Pet{}
    conn = get conn, pet_path(conn, :show, pet)
    assert json_response(conn, 200)["data"] == %{"id" => pet.id,
      "name" => pet.name,
      "gender" => pet.gender,
      "species" => pet.species,
      "shelter" => pet.shelter,
      "race" => pet.race,
      "birthdate" => pet.birthdate,
      "img_url" => pet.img_url,
      "neutered" => pet.neutered,
      "tattooed" => pet.tattooed,
      "link" => pet.link}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, pet_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, pet_path(conn, :create), pet: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Pet, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, pet_path(conn, :create), pet: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    pet = Repo.insert! %Pet{}
    conn = put conn, pet_path(conn, :update, pet), pet: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Pet, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    pet = Repo.insert! %Pet{}
    conn = put conn, pet_path(conn, :update, pet), pet: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    pet = Repo.insert! %Pet{}
    conn = delete conn, pet_path(conn, :delete, pet)
    assert response(conn, 204)
    refute Repo.get(Pet, pet.id)
  end
end
