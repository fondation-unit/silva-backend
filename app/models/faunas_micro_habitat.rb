class FaunasMicroHabitat < ApplicationRecord
  belongs_to :fauna
  belongs_to :micro_habitat
end

# == Schema Information
#
# Table name: faunas_micro_habitats
#
#  id               :bigint           not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  fauna_id         :bigint           not null
#  micro_habitat_id :bigint           not null
#
# Indexes
#
#  index_faunas_micro_habitats_on_fauna_id          (fauna_id)
#  index_faunas_micro_habitats_on_micro_habitat_id  (micro_habitat_id)
#
# Foreign Keys
#
#  fk_rails_...  (fauna_id => faunas.id)
#  fk_rails_...  (micro_habitat_id => micro_habitats.id)
#
