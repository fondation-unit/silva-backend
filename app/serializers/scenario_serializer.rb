# frozen_string_literal: true

class ScenarioSerializer
  include JSONAPI::Serializer

  attributes :id, :author, :name, :level, :subject, :description, :created_at, :updated_at
end
