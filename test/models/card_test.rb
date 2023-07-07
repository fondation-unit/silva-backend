require "test_helper"

class CardTest < ActiveSupport::TestCase
  test "invalid without name, description, typeable type & id" do
    card = Card.new(
      name: nil,
      description: nil,
      note: nil,
      typeable_type: nil,
      typeable_id: nil
    )
    refute card.valid?, "card is valid without a name, description, typeable type & id"
    assert_not_nil card.errors[:name], "no validation error for name present"
    assert_not_nil card.errors[:description], "no validation error for description present"
    assert_not_nil card.errors[:typeable_type], "no validation error for typeable_type present"
    assert_not_nil card.errors[:typeable_id], "no validation error for typeable_id present"
  end

  test "name is too short" do
    card = cards(:lion)
    card.name = "AA"

    refute card.valid?, "card is not valid"
    assert_not_nil card.errors[:name], "no length error for name"
  end
end