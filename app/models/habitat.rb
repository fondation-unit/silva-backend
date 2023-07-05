class Habitat < ApplicationRecord

  has_many :faunas

    validates :name, presence: true 
    
end

# == Schema Information
#
# Table name: habitats
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#