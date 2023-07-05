class Card < ApplicationRecord

    belongs_to :typeable, polymorphic: true

    validates :name, presence: true
    validates :description, presence: true
    validates :note, presence: false
    validates :typeable_type, presence: true
    validates :typeable_id, presence: true

end
