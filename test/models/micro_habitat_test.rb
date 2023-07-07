require "test_helper"

class MicroHabitatTest < ActiveSupport::TestCase
  test "invalid without name" do
    micro_habitat = MicroHabitat.new(
      name: nil
    )
    refute micro_habitat.valid?, "micro_habitat is valid without a name"
    assert_not_nil micro_habitat.errors[:name], "no validation error for name present"
  end

  test "name is too short" do
    micro_habitat = micro_habitats(:leaf)
    micro_habitat.name = "AA"

    refute micro_habitat.valid?, "micro_habitat is not valid"
    assert_not_nil micro_habitat.errors[:name], "no length error for name"
  end
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
