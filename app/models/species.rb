class Species < ApplicationRecord
  has_many :floras_species, dependent: :destroy
  has_many :floras, through: :floras_species

  validates :name, presence: true, length: { minimum: 3 }
end

# == Schema Information
#
# Table name: species
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
