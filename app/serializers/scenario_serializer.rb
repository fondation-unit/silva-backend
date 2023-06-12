# frozen_string_literal: true

class ScenarioSerializer
  include JSONAPI::Serializer

  attributes :id, :author, :name
end
