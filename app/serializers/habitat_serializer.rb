# frozen_string_literal: true

class HabitatSerializer
  include JSONAPI::Serializer

  attributes :id, :name
end