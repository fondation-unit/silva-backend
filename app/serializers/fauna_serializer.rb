# frozen_string_literal: true

class FaunaSerializer
  include JSONAPI::Serializer

  attributes :id

  has_many :habitats
end