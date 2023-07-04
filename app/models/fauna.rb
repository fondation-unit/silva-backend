class Fauna < ApplicationRecord

    belongs_to :animal_scientific_order, class_name: 'AnimalScientificOrder', foreign_key: :animal_scientific_order_id
    has_one :card, as: :typeable, dependent: :destroy
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
