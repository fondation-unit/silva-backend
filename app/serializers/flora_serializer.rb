# frozen_string_literal: true

class FloraSerializer
  include JSONAPI::Serializer

  attributes :id

  has_one :card
  has_many :species
end