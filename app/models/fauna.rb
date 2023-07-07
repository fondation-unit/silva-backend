class Fauna < ApplicationRecord
  belongs_to :animal_scientific_order, class_name: "AnimalScientificOrder" # , foreign_key: :animal_scientific_order_id
  has_one :card, as: :typeable, dependent: :destroy

  has_many :faunas_predators, dependent: :delete_all
  has_many :predators, through: :faunas_predators

  has_many :faunas_habitats, dependent: :delete_all
  has_many :habitats, through: :faunas_habitats

  has_many :faunas_micro_habitats, dependent: :delete_all
  has_many :micro_habitats, through: :faunas_micro_habitats

  accepts_nested_attributes_for :card, :habitats, :micro_habitats, :predators

  def build_associations(params)
    create_card(params[:card_attributes])

    habitats << Habitat.where(id: [params[:habitats_attributes]])
    micro_habitats << MicroHabitat.where(id: [params[:micro_habitats_attributes]])
    predators << Fauna.where(id: [params[:predators_attributes]])
  end

  # rubocop:disable Metrics/AbcSize
  def update_associations(params)
    card.update(params[:card_attributes])

    habitats.delete_all
    micro_habitats.delete_all
    predators.delete_all

    habitats << Habitat.where(id: [params[:habitats_attributes]])
    micro_habitats << MicroHabitat.where(id: [params[:micro_habitats_attributes]])
    predators << Fauna.where(id: [params[:predators_attributes]])
  end
  # rubocop:enable Metrics/AbcSize
end

# == Schema Information
#
# Table name: faunas
#
#  id             :bigint       not null, primary key
#  created_at         :datetime     not null
#  updated_at         :datetime     not null
#  animal_scientific_order_id :bigint       not null
#
# Indexes
#
#  index_faunas_on_animal_scientific_order_id  (animal_scientific_order_id)
#
# Foreign Keys
#
#  fk_rails_...  (animal_scientific_order_id => animal_scientific_orders.id)
#
