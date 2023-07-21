# frozen_string_literal: true

class FloraSerializer
  include JSONAPI::Serializer

  attributes :id

  has_one :card
  has_many :species
end

# == Schema Information
#
# Table name: floras
#
#  id            :bigint           not null, primary key
#  buildup_speed :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
