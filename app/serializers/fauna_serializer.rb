# frozen_string_literal: true

class FaunaSerializer
  include JSONAPI::Serializer

  attributes :id

  has_one :card
  has_one :animal_scientific_order
  has_many :habitats
  has_many :micro_habitats
  has_many :predators

end

# == Schema Information
#
# Table name: faunas
#
#  id                         :bigint           not null, primary key
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  animal_scientific_order_id :bigint           not null
#
# Indexes
#
#  index_faunas_on_animal_scientific_order_id  (animal_scientific_order_id)
#
# Foreign Keys
#
#  fk_rails_...  (animal_scientific_order_id => animal_scientific_orders.id)
#
