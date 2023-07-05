class FaunaHabitat < ApplicationRecord
  belongs_to :fauna
  belongs_to :habitat
end

# == Schema Information
#
# Table name: fauna_habitats
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  fauna_id   :bigint           not null
#  habitat_id :bigint           not null
#
# Indexes
#
#  index_fauna_habitats_on_fauna_id    (fauna_id)
#  index_fauna_habitats_on_habitat_id  (habitat_id)
#
# Foreign Keys
#
#  fk_rails_...  (fauna_id => faunas.id)
#  fk_rails_...  (habitat_id => habitats.id)
#
