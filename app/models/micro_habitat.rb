class MicroHabitat < ApplicationRecord
  has_many :faunas_micro_habitats, dependent: :destroy
  has_many :faunas, through: :faunas_micro_habitats

  validates :name, presence: true, length: { minimum: 3 }
end

# == Schema Information
#
# Table name: micro_habitats
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
