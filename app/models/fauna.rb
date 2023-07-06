class Fauna < ApplicationRecord
    
    belongs_to :animal_scientific_order, class_name: 'AnimalScientificOrder', foreign_key: :animal_scientific_order_id
    has_one :card, as: :typeable, dependent: :destroy

    has_many :faunas_predators, dependent: :delete_all
    has_many :predators, through: :faunas_predators

    has_many :faunas_habitats, dependent: :delete_all
    has_many :habitats, through: :faunas_habitats

    has_many :faunas_micro_habitats, dependent: :delete_all
    has_many :micro_habitats, through: :faunas_micro_habitats

    validates :animal_scientific_order, presence: true

    accepts_nested_attributes_for :card, :habitats, :micro_habitats, :predators


    def build_associations(params)
        create_card(params[:card_attributes])

        habitats = Habitat.where(id: [params[:habitats_attributes]])
        self.habitats << habitats

        microhabitats = MicroHabitat.where(id: [params[:micro_habitats_attributes]])
        self.micro_habitats << microhabitats

        predators = Fauna.where(id: [params[:predators_attributes]])
        self.predators << predators
    end

    def update_associations(params)
        card.update(params[:card_attributes])

        self.habitats.delete_all
        new_habitats = Habitat.where(id: [params[:habitats_attributes]])
        self.habitats << new_habitats

        self.micro_habitats.delete_all
        microhabitats = MicroHabitat.where(id: [params[:micro_habitats_attributes]])
        self.micro_habitats << microhabitats

        self.predators.delete_all
        predators = Fauna.where(id: [params[:predators_attributes]])
        self.predators << predators
    end
end

# == Schema Information
#
# Table name: faunas
#
#  id                         :bigint           not null, primary key
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  animal_scientific_order_id :bigint           not null
#
# Indexes
#
#  index_faunas_on_animal_scientific_order_id  (animal_scientific_order_id)
#
# Foreign Keys
#
#  fk_rails_...  (animal_scientific_order_id => animal_scientific_orders.id)
#
