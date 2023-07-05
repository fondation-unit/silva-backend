class Scenario < ApplicationRecord
end

# == Schema Information
#
# Table name: scenarii
#
#  id          :bigint           not null, primary key
#  author      :string(255)
#  description :text(65535)
#  level       :integer
#  name        :string(255)
#  subject     :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
