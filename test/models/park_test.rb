require 'test_helper'
require 'minitest/rails'

class ParkTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
  end

  test "the truth" do
    park = Park.new
    park.name = "adfasdf"
    park.description="asfsdfsdf"
    park.cover = "dfadfasf"
    park.avatar = "asdfasf"
    park.address_line_1 = "safasdfasdf"
    park.address_line_2="sfsfdsf"
    park.post_code = "sfdsafd"
    park.user = @user
    park.save!
    assert park.valid?
  end
end
