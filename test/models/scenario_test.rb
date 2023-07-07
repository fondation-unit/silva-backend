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
