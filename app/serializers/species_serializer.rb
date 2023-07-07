# frozen_string_literal: true

class SpeciesSerializer
  include JSONAPI::Serializer

  attributes :id, :name
end