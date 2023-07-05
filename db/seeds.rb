# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

22.times { |index|
  Scenario.create!(
    author: Faker::Name.name,
    name: "Scenario #{index + 1}",
    level: "Level #{rand(1..5)}",
    subject: Faker::Company.bs,
    description: Faker::Markdown.emphasis
  )
}

