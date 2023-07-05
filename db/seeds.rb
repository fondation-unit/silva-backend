# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

22.times { |index|
  Scenario.create!(
    author: "Author #{rand(1..5)}",
    name: "Scenario #{index + 1}",
    level: "Level #{rand(1..5)}",
    subject: "#{(0...8).map { ([65, 97].sample + rand(26)).chr }.push(rand(99)).join}",
    description: "#{(0...100).map { ([65, 97].sample + rand(26)).chr }.push(rand(99)).join}"
  )
}