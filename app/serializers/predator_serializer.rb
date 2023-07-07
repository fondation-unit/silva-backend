# frozen_string_literal: true

class PredatorSerializer
  include JSONAPI::Serializer

  attributes :id

  attribute :card_name do |object|
    object.card&.name
  end

  has_one :card
end
