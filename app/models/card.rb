class Card < ApplicationRecord
  belongs_to :typeable, polymorphic: true, optional: true

  validates :name, presence: true, length: { minimum: 3 }
  validates :description, presence: true
  validates :note, presence: false
  validates :typeable_type, presence: true
  validates :typeable_id, presence: true
end

# == Schema Information
#
# Table name: cards
#
#  id            :bigint           not null, primary key
#  description   :text(65535)
#  name          :string(255)
#  note          :text(65535)
#  typeable_type :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  typeable_id   :bigint
#
# Indexes
#
#  index_cards_on_typeable                       (typeable_type,typeable_id)
#  index_cards_on_typeable_type_and_typeable_id  (typeable_type,typeable_id) UNIQUE
#
