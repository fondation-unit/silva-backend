class Flora < ApplicationRecord

    has_many :species
    has_one :card, as: :typeable, dependent: :destroy

    enum buildup_speed: {
        slow: 0,
        medium: 1,
        fast: 2
    }

    validates :buildup_speed, presence: true

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
