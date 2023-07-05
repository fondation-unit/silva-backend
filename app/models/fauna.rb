class Fauna < ApplicationRecord

    belongs_to :animal_scientific_order, class_name: 'AnimalScientificOrder', foreign_key: :animal_scientific_order_id
    has_one :card, as: :typeable, dependent: :destroy

    has_many :faunas_predators
    has_many :predators, through: :faunas_predators

    enum habitat: {
        woodforest: 0,
        pineforest: 1,
        plain: 2,
        glade: 3,
        swamp: 4
    }

    enum micro_habitat: {
        moss: 0,
        leaf: 1,
        dead_leaf: 2,
        log: 3,
        rotten_log: 4,
    }

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
#  habitat                    :string(255)
#  micro_habitat              :string(255)
#  predator                   :string(255)
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  animal_scientific_order_id :bigint
#
# Indexes
#
#  index_faunas_on_animal_scientific_order_id  (animal_scientific_order_id)
#
# Foreign Keys
#
#  fk_rails_...  (animal_scientific_order_id => animal_scientific_orders.id)
#
