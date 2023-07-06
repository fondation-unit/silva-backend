# frozen_string_literal: true

class AnimalScientificOrderSerializer
  include JSONAPI::Serializer

  attributes :id, :name
end