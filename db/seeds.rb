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

predator_order = AnimalScientificOrder.create!(name: "Dinosaures")
order = AnimalScientificOrder.create!(name: "Volatiles")

predator1 = Fauna.create!(
  animal_scientific_order: predator_order,
  habitat: :woodforest,
  micro_habitat: :leaf
)
predator2 = Fauna.create!(
  animal_scientific_order: predator_order,
  habitat: :woodforest,
  micro_habitat: :leaf
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
  habitat: :woodforest,
  micro_habitat: :leaf
)

card = fauna.build_card(
  typeable: fauna,
  name: Faker::Name.name, 
  description: Faker::Markdown.emphasis
)
card.save

fauna.predators << [predator1, predator2]
