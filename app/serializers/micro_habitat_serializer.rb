# frozen_string_literal: true

class MicroHabitatSerializer
  include JSONAPI::Serializer

  attributes :id, :name
end