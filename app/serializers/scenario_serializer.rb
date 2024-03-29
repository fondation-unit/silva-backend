# frozen_string_literal: true

class ScenarioSerializer
  include JSONAPI::Serializer

  attributes :id, :author, :name, :level, :subject, :description

  attribute :created_at do |object|
    object.created_at.strftime("%d/%m/%Y - %H:%m")
  end

  attribute :updated_at do |object|
    object.updated_at.strftime("%d/%m/%Y - %H:%m")
  end
end

# == Schema Information
#
# Table name: scenarii
#
#  id          :bigint           not null, primary key
#  author      :string(255)
#  description :text(65535)
#  level       :integer
#  name        :string(255)
#  subject     :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
