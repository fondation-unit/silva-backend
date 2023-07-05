class AnimalScientificOrder < ApplicationRecord

    has_many :faunas

    validates :name, presence: true 

end
