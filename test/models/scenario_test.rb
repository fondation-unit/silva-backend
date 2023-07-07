require "test_helper"

class ScenarioTest < ActiveSupport::TestCase

  test "invalid without name" do
    scenario = Scenario.new(
      author: "test",
      description: "desciption...",
      level: 0,
      subject: "subject"
    )
    refute scenario.valid?, "scenario is valid without a name"
    assert_not_nil scenario.errors[:name], "no validation error for name present"
  end

end
