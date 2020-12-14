require 'test_helper'

class CarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    # @park = parks(:one)
    @user = users(:one)
    @car = cars(:one)
  end

  test "should get user car list" do
    get "/api/cars/#{@user.id}/list",xhr:true
    assert_response :success
    assert_equal JSON.parse(@user.cars.to_json),JSON.parse(@response.body)
  end

  test "should create  car list" do
    sign_in()
    assert_difference('Car.count',1) do
      post "/api/cars",xhr:true,params:{name:"asdf",brand:"basdf",number_plate:"asdf adf",user_id:@user.id},headers:{Authorization: @env}
    end
    assert_response :success
  end

  test "should not create car list" do
    sign_in()
    assert_difference('Car.count',0) do
      post "/api/cars",xhr:true,params:{name:"asdf",brand:"basdf",number_plate:"asdf adf",user_id:@user.id}
    end
    assert_response 401
  end

  test "should update  car " do
    sign_in()
    @car.name = "adsf"
    patch "/api/cars/#{@car.id}",xhr:true,params:@car.as_json,headers:{Authorization: @env}
    assert_response :success
    assert_equal @car.name, JSON.parse(@response.body)['name']
  end

  test "should not update car  without authorization header" do
    sign_in()
    @car.name = "adsf"
    patch "/api/cars/#{@car.id}",xhr:true,params:@car.as_json,headers:{Authorization: @env}
    assert_response :success
    assert_equal @car.name, JSON.parse(@response.body)['name']
  end

  test "should destroy  car " do
    sign_in()
    assert_difference('Car.count',-1) do
      delete "/api/cars/#{@car.id}",xhr:true,headers:{Authorization: @env}
    end
    assert_response :success
  end

  test "should not destroy  car " do
    sign_in()
    assert_difference('Car.count',0) do
      delete "/api/cars/#{@car.id}",xhr:true
    end
    assert_response 401
  end

end
