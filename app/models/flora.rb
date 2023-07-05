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

# == Schema Information
#
# Table name: floras
#
#  id                 :bigint           not null, primary key
#  associated_species :string(255)
#  buildup_speed      :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
