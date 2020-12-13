require 'test_helper'

class SlotsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @park = parks(:one)
    @user = users(:one)
    @slot = park_slots(:one)
  end

  test "should create Park Slots" do
    sign_in()
    assert_difference('ParkSlot.count') do
      post '/api/slots', params: { park_id:@park.id,width: 111, height: 123, price: 1234},headers: {'Authorization' => @env},xhr:true
    end

    assert_response :success
  end

  test "should  not create Park Slots without logged in" do
    sign_in()
    post '/api/slots', params: { park_id:@park.id,width: 111, height: 123, price: 1234},xhr:true

    assert_response 401
  end

  test "should update Park Slots when logged in" do
    sign_in()
    @slot.height = 10
    patch '/api/slots', params: @slot.to_json,xhr:true

    assert_response 401
  end

end
