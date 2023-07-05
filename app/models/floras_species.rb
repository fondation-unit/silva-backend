class FlorasSpecies < ApplicationRecord
  belongs_to :flora
  belongs_to :species
end

# == Schema Information
#
# Table name: floras_species
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  flora_id   :bigint           not null
#  species_id :bigint           not null
#
# Indexes
#
#  index_floras_species_on_flora_id    (flora_id)
#  index_floras_species_on_species_id  (species_id)
#
# Foreign Keys
#
#  fk_rails_...  (flora_id => floras.id)
#  fk_rails_...  (species_id => species.id)
#
