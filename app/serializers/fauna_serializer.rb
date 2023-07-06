# frozen_string_literal: true

class FaunaSerializer
  include JSONAPI::Serializer

  attributes :id

  has_one :card
  has_one :animal_scientific_order
  has_many :habitats
  has_many :micro_habitats
  has_many :predators

end