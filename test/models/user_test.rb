require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "Must Create User" do
    user = User.new
    user.username="adf"
    user.email="sadf"
    user.password_digest="sdf"
    user.save!
    assert user.valid?
  end

  test "Must Not Create User without password" do
    user = User.new
    user.username="adf"
    user.email="sadf"
    assert_not user.save
  end

  test "Must Not Create User without email" do
    user = User.new
    user.username="adf"
    user.password_digest="sdf"
    assert_not user.save
  end

  test "Can Create User without username" do
    user = User.new
    user.email="sadf"
    user.password_digest="sdf"
    assert user.save
  end

  test "Can't Create User width duplicate email" do
    user = User.create({
      email: "asdf@gmail.com",
      password_digest:"adsf",
      username:"username"
    })
    user_two = User.new({
      email: "asdf@gmail.com",
      password_digest:"adsf",
      username:"username"
    })
    assert_not user_two.save
  end



end
