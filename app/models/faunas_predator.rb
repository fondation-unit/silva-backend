class FaunasPredator < ApplicationRecord
  belongs_to :fauna, class_name: "Fauna", foreign_key: :fauna_id
  belongs_to :predator, class_name: "Fauna", foreign_key: :predator_id
end

# == Schema Information
#
# Table name: faunas_predators
#
#  id          :bigint           not null, primary key
#  fauna_id    :bigint
#  predator_id :bigint
#
# Indexes
#
#  index_faunas_predators_on_fauna_id     (fauna_id)
#  index_faunas_predators_on_predator_id  (predator_id)
#
# Foreign Keys
#
#  fk_rails_...  (fauna_id => faunas.id)
#  fk_rails_...  (predator_id => faunas.id)
#
