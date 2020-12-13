require 'test_helper'

class ParkSlotTest < ActiveSupport::TestCase
  setup do
    @park = parks(:one)
  end

  test "Must Create Park Slot" do
    park_slot = ParkSlot.new
    park_slot.height=100
    park_slot.width=1234
    park_slot.price=4341
    park_slot.park = @park
    park_slot.save!
    assert park_slot.valid?
  end

  test "Must Fail Create Park Slot" do
    park_slot = ParkSlot.new
    park_slot.height=100
    park_slot.width=1234
    park_slot.price=4341
    # park_slot.park = @park

    assert_not park_slot.save
  end

  test "Must Fail Create Park Slot without height" do
    park_slot = ParkSlot.new
    park_slot.width=1234
    park_slot.price=4341
    park_slot.park = @park

    assert_not park_slot.save
  end

  test "Must Fail Create Park Slot without price" do
    park_slot = ParkSlot.new
    park_slot.height=100
    park_slot.width=1234
    park_slot.park = @park

    assert_not park_slot.save
  end

  test "Must Fail Create Park Slot without width" do
    park_slot = ParkSlot.new
    park_slot.height=100
    # park_slot.width=1234
    park_slot.price=4341
    park_slot.park = @park

    assert_not park_slot.save
  end
end
