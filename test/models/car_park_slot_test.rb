require 'test_helper'

class CarParkSlotTest < ActiveSupport::TestCase

  setup do
    @car = cars(:three)
    @park_slot = park_slots(:three)
  end

  test "Must Create Car Park Slot" do
    car_park_slot = CarParkSlot.new({
      car:@car,
      park_slot:@park_slot
    })
    car_park_slot.save
    assert  car_park_slot.valid?
  end

  test "Must Not Create Car Park Slot with same car and park slot" do
    car_park_slot = CarParkSlot.new({
      car:cars(:two),
      park_slot:park_slots(:two)
    })
    
    assert_raise(Exception){car_park_slot.save} 
  end

  test "Must Not Create Car Park Slot with only car" do
    car_park_slot = CarParkSlot.new({
      car:cars(:two),
      # park_slot:park_slots(:two)
    })
    
    assert_not car_park_slot.save
  end

  test "Must Not Create Car Park Slot with only park_slot" do
    car_park_slot = CarParkSlot.new({
      # car:cars(:two),
      park_slot:park_slots(:two)
    })
    
    assert_not car_park_slot.save
  end


end
