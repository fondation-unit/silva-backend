class Flora < ApplicationRecord

    has_one :card, as: :typeable, dependent: :destroy

    enum associated_species: { 
        birds: 0, 
        mammals: 1, 
        reptiles: 2, 
        amphibians: 3, 
        insects: 4, 
        arachnids: 5,
        fungi: 6,
        bacteria: 7,
        arthropods: 8,
    }

    enum buildup_speed: {
        slow: 0,
        medium: 1,
        fast: 2
    }

    validates :associated_species, presence: false
    validates :buildup_speed, presence: true

end
