require 'test_helper'

class CarParkSlotsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @park_slot = park_slots(:one)
    @park_slot_two = park_slots(:two)
    @car = cars(:one)
  end
  
  test "create Car park slot" do
    sign_in()
    post '/api/car_park_slots',params:{park_slot_id:@park_slot_two.id,car_id:@car.id},headers: {Authorization:@env}
    assert_response :success
    assert_equal @park_slot_two.id, JSON.parse(@response.body)['park_slot_id']
  end

  test "Fail create Diplicate Car park slot" do
    sign_in()
    assert_raise(){
      post '/api/car_park_slots',params:{park_slot_id:@park_slot.id,car_id:@car.id},headers: {Authorization:@env}
    }
  end



end
