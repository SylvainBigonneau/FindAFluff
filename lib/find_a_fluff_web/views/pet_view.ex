defmodule FindAFluffWeb.PetView do
  use FindAFluffWeb, :view

  def render("index.json", %{pets: pets, count: count}) do
    %{pets: render_many(pets, FindAFluffWeb.PetView, "pet.json"), count: count}
  end

  def render("show.json", %{pet: pet}) do
    %{data: render_one(pet, FindAFluffWeb.PetView, "pet.json")}
  end

  def render("pet.json", %{pet: pet}) do
    %{id: pet.id,
      name: pet.name,
      gender: pet.gender,
      species: pet.species,
      shelter: pet.shelter,
      race: pet.race,
      birthdate: pet.birthdate,
      img_url: pet.img_url,
      neutered: pet.neutered,
      tattoo: pet.tattoo,
      link: pet.link,
      race_details: pet.race_details}
  end
end
