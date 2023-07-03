class Card < ApplicationRecord

    belongs_to :type, polymorphic: true

end
