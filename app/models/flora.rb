class Flora < ApplicationRecord
  has_one :card, as: :typeable, dependent: :destroy

  has_many :floras_species, dependent: :delete_all
  has_many :species, through: :floras_species

  enum buildup_speed: {
    slow: 0,
    medium: 1,
    fast: 2
  }

  validates :buildup_speed, presence: true

  accepts_nested_attributes_for :card, :species

  def build_associations(params)
    create_card(params[:card_attributes])
    species << Species.where(id: [params[:species_attributes]])
  end

  def update_associations(params)
    card.update(params[:card_attributes])
    species.delete_all
    species << Species.where(id: [params[:species_attributes]])
  end

end

# == Schema Information
#
# Table name: floras
#
#  id            :bigint           not null, primary key
#  buildup_speed :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
