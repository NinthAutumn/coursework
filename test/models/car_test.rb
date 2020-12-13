require 'test_helper'

class CarTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
  end
  
  test "Must  Create Car" do
    car = Car.new({
      name:"asdf",
      brand:"asdfasdf",
      number_plate: "Adfasdf",
      user:@user
    })
    car.save
    assert car.valid?
  end

  test "Must Not Create Car without number_plate" do
    car = Car.new({
      name:"asdf",
      brand:"asdfasdf",
      user:@user
    })
   
    assert_not  car.save
  end

  test "Must Not Create Car without name" do
    car = Car.new({
      brand:"asdfasdf",
      number_plate:"asdfasdf",
      user:@user
    })
   
    assert_not  car.save
  end
end
