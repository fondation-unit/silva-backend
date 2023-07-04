class Flora < ApplicationRecord

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

    validates :ssociated_species, presence: false
    validates :buildup_speed, presence: true

end
