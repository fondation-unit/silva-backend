require "test_helper"

class SpeciesTest < ActiveSupport::TestCase
  test "invalid without name" do
    species = Species.new(
      name: nil
    )
    refute species.valid?, "species is valid without a name"
    assert_not_nil species.errors[:name], "no validation error for name present"
  end

  test "name is too short" do
    species = species(:mammal)
    species.name = "AA"

    refute species.valid?, "species is not valid"
    assert_not_nil species.errors[:name], "no length error for name"
  end
end