# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

=begin
22.times { |index|
  Scenario.create!(
    author: Faker::Name.name,
    name: "Scenario #{index + 1}",
    level: "Level #{rand(1..5)}",
    subject: Faker::Company.bs,
    description: Faker::Markdown.emphasis
  )
}
=end
 
# VARIABLES
builduSpeedType = ["slow", "medium", "fast"]

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

# FLORA
flora = Flora.create!(
  buildup_speed: builduSpeedType.sample
)

floras_species = FlorasSpecies.create!(
  flora: flora,
  species: species.sample
)

# FAUNA
5.times { |index| 
  fauna = Fauna.create!(
    animal_scientific_order: animal_scientific_orders.sample
  )
  card = fauna.build_card(
    typeable: fauna,
    name: Faker::Name.name, 
    description: Faker::Markdown.emphasis
  )
  card.save

  fauna.predators << (1..4).map { Fauna.all.sample }
  fauna.habitats << habitats.sample
  fauna.micro_habitats << micro_habitats.sample
}

fauna = Fauna.first

# CARD
5.times { |index| 
  Card.create!(
    typeable: flora,
    name: Faker::Name.name, 
    description: Faker::Markdown.emphasis
  )
}
