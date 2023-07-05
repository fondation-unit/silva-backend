class Fauna < ApplicationRecord
    
    belongs_to :animal_scientific_order, class_name: 'AnimalScientificOrder', foreign_key: :animal_scientific_order_id
    belongs_to :habitat, class_name: 'Habitat', foreign_key: :habitat_id
    belongs_to :micro_habitat, class_name: 'MicroHabitat', foreign_key: :micro_habitat_id
    has_one :card, as: :typeable, dependent: :destroy

    has_many :faunas_predators
    has_many :predators, through: :faunas_predators

    #validates :animal_scientific_order, presence: true
    validates :habitat, presence: true
    validates :micro_habitat, presence: false
    validates :predator, presence: false
    
end

# == Schema Information
#
# Table name: faunas
#
#  id                         :bigint           not null, primary key
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  animal_scientific_order_id :bigint           not null
#  habitat_id                 :bigint           not null
#  micro_habitat_id           :bigint           not null
#
# Indexes
#
#  index_faunas_on_animal_scientific_order_id  (animal_scientific_order_id)
#  index_faunas_on_habitat_id                  (habitat_id)
#  index_faunas_on_micro_habitat_id            (micro_habitat_id)
#
# Foreign Keys
#
#  fk_rails_...  (animal_scientific_order_id => animal_scientific_orders.id)
#  fk_rails_...  (habitat_id => habitats.id)
#  fk_rails_...  (micro_habitat_id => micro_habitats.id)
#
