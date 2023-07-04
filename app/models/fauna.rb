class Fauna < ApplicationRecord

    has_many :predators, through: :faunas_predators
    
end
