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

habitat1 = Habitat.create!(
  name: :woodforest
)
habitat2 = Habitat.create!(
  name: :pineforest
)
habitat3 = Habitat.create!(
  name: :plain
)
habitat4 = Habitat.create!(
  name: :glade
)
habitat5 = Habitat.create!(
  name: :swamp
)

micro_habitat1 = MicroHabitat.create!(
  name: :moss
)
micro_habitat2 = MicroHabitat.create!(
  name: :leaf
)
micro_habitat3 = MicroHabitat.create!(
  name: :dead_leaf
)
micro_habitat4 = MicroHabitat.create!(
  name: :log
)
micro_habitat5 = MicroHabitat.create!(
  name: :rotten_log
)

predator_order = AnimalScientificOrder.create!(name: "Dinosaures")
order = AnimalScientificOrder.create!(name: "Volatiles")

predator1 = Fauna.create!(
  animal_scientific_order: predator_order,
  habitat: habitat1,
  micro_habitat: micro_habitat2
)
predator2 = Fauna.create!(
  animal_scientific_order: predator_order,
  habitat: habitat1,
  micro_habitat: micro_habitat2
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
  animal_scientific_order: order,
  habitat: habitat1,
  micro_habitat: micro_habitat2
)

card = fauna.build_card(
  typeable: fauna,
  name: Faker::Name.name, 
  description: Faker::Markdown.emphasis
)
card.save

fauna.predators << [predator1, predator2]

