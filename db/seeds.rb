# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

# ADMIN USER
User.create!(
  firstname: "admin",
  lastname: "user",
  email: "admin@localhost.com",
  password: "password",
  confirmation_sent_at: DateTime.now(),
  confirmed_at: DateTime.now()
)

# SCENARII
22.times do |index|
  Scenario.create!(
    author: Faker::Name.name,
    name: "Scenario #{index + 1}",
    level: "Level #{rand(1..5)}",
    subject: Faker::Company.bs,
    description: Faker::Markdown.emphasis
  )
end

# VARIABLES
buildup_speed_type = ["slow", "medium", "fast"]

%i[birds mammals reptiles amphibians insects arachnids arthropods fungi bacteria].each do |type|
  Species.create!(name: type)
end

%i[woodforest pineforest plain glade swamp].each do |type|
  Habitat.create!(name: type)
end

%i[moss leaf dead_leaf log rotten_log].each do |type|
  MicroHabitat.create!(name: type)
end

%i[canidae felidae equidae bovidae aves].each do |type|
  AnimalScientificOrder.create!(name: type)
end

species = Species.all
habitats = Habitat.all
micro_habitats = MicroHabitat.all
animal_scientific_orders = AnimalScientificOrder.all

# FAUNA
5.times do
  fauna = Fauna.create!(
    animal_scientific_order: animal_scientific_orders.sample
  )
  card = fauna.build_card(
    typeable: fauna,
    name: Faker::Creature::Animal.name,
    description: Faker::Markdown.emphasis
  )
  card.save

  fauna.predators << (1..4).map { Fauna.all.sample }
  fauna.habitats << habitats.sample
  fauna.micro_habitats << micro_habitats.sample
end

# CARD
5.times do
  flora = Flora.create!(
    buildup_speed: buildup_speed_type.sample
  )
  FlorasSpecies.create!(
    flora: flora,
    species: species.sample
  )
  Card.create!(
    typeable: flora,
    name: Faker::Name.name,
    description: Faker::Markdown.emphasis
  )
end
