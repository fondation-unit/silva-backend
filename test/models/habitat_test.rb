require "test_helper"

class HabitatTest < ActiveSupport::TestCase
  test "invalid without name" do
    habitat = Habitat.new(
      name: nil
    )
    refute habitat.valid?, "habitat is valid without a name"
    assert_not_nil habitat.errors[:name], "no validation error for name present"
  end

  test "name is too short" do
    habitat = habitats(:temperate)
    habitat.name = "AA"

    refute habitat.valid?, "habitat is not valid"
    assert_not_nil habitat.errors[:name], "no length error for name"
  end
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
