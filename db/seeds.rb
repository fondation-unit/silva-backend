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

=begin 
VARIABLE
=end
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
habitat = Habitat.all
micro_habitat = MicroHabitat.all
animalScientificOrder = AnimalScientificOrder.all


=begin 
FLORA
=end
flora = Flora.create!(
  buildup_speed: builduSpeedType.sample
)

floras_species = FlorasSpecies.create!(
  flora: flora,
  species: species.sample
)

=begin 
FAUNA
=end
predator1 = Fauna.create!(
  animal_scientific_order: animalScientificOrder.sample,
  habitat: habitat.sample,
  micro_habitat: micro_habitat.sample
)
predator2 = Fauna.create!(
  animal_scientific_order: animalScientificOrder.sample,
  habitat: habitat.sample,
  micro_habitat: micro_habitat.sample
)
predator1.build_card(
  typeable: predator1,
  name: Faker::Name.name, 
  description: Faker::Markdown.emphasis
).save
predator2.build_card(
  typeable: predator2,
  name: Faker::Name.name, 
  description: Faker::Markdown.emphasis
).save


fauna = Fauna.create!(
  animal_scientific_order: animalScientificOrder.sample,
  habitat: habitat.sample,
  micro_habitat: micro_habitat.sample
)


=begin 
CARD
=end
card = fauna.build_card(
  typeable: fauna,
  name: Faker::Name.name, 
  description: Faker::Markdown.emphasis
)

5.times {  |index| 
  Card.create!(
    typeable: fauna,
    name: Faker::Name.name, 
    description: Faker::Markdown.emphasis
  )
}

5.times { |index| 
  Card.create!(
    typeable: flora,
    name: Faker::Name.name, 
    description: Faker::Markdown.emphasis
  )
}


card.save
fauna.predators << [predator1, predator2]

