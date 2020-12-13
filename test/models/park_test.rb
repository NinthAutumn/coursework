require 'test_helper'

class ParkTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
  end

  test "Must Not Create Park without name" do
    park = Park.new
    park.description="asfsdfsdf"
    park.cover = "dfadfasf"
    park.avatar = "asdfasf"
    park.address_line_1 = "safasdfasdf"
    park.address_line_2="sfsfdsf"
    park.post_code = "sfdsafd"
    park.user = @user
    assert_not park.save
  end

  test "Must Not Create Park without cover" do
    park = Park.new
    park.name = "adfasdf"
    park.description="asfsdfsdf"
    park.avatar = "asdfasf"
    park.address_line_1 = "safasdfasdf"
    park.address_line_2="sfsfdsf"
    park.post_code = "sfdsafd"
    park.user = @user
    assert_not park.save
  end

  test "Must Not Create Park without avatar" do
    park = Park.new
    park.name = "adfasdf"
    park.description="asfsdfsdf"
    park.cover = "dfadfasf"
    park.address_line_1 = "safasdfasdf"
    park.address_line_2="sfsfdsf"
    park.post_code = "sfdsafd"
    park.user = @user
    assert_not park.save
  end

  test "Must Not Create Park without post code" do
    park = Park.new
    park.name = "adfasdf"
    park.description="asfsdfsdf"
    park.cover = "dfadfasf"
    park.avatar = "asdfasf"
    park.address_line_1 = "safasdfasdf"
    park.address_line_2="sfsfdsf"
    park.user = @user
    assert_not park.save
  end

  test "Must Not Create Park without address_line_1" do
    park = Park.new
    park.name = "adfasdf"
    park.description="asfsdfsdf"
    park.cover = "dfadfasf"
    park.avatar = "asdfasf"
    park.address_line_2="sfsfdsf"
    park.post_code = "sfdsafd"
    park.user = @user
    assert_not park.save
  end

  test "Must Not Create Park without user" do
    park = Park.new
    park.name = "adfasdf"
    park.description="asfsdfsdf"
    park.cover = "dfadfasf"
    park.avatar = "asdfasf"
    park.address_line_1 = "safasdfasdf"
    park.address_line_2="sfsfdsf"
    park.post_code = "sfdsafd"
    assert_not park.save
  end


  test "Must Create Park" do
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
