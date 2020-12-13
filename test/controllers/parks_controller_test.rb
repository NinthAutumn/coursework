require 'test_helper'
require 'JSON'
class ParksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @park = parks(:one)
    @user = users(:one)
  end

  test "should create park" do
    sign_in()
    assert_difference('Park.count') do
      post '/api/parks', params: { user_id:@user.id,address_line_1: "asdf", address_line_2: "adsf", avatar: "@park.avatar", cover: "@park.cover", description: "@park.description", images: "@park.images", name: "@park.name", post_code: "@park.post_code" },headers: {'Authorization' => @env},xhr:true
    end

    assert_response :success
  end

  test "should not create park when not logged in " do
    assert_no_difference('Park.count') do
      post '/api/parks', params: { user_id:@user.id,address_line_1: "asdf", address_line_2: "adsf", avatar: "@park.avatar", cover: "@park.cover", description: @park.description, images: @park.images, name: @park.name, post_code: @park.post_code },xhr:true
    end
    assert_response 401
  end

  test "should not update park when not logged in " do
    sign_in()
    @park.name = "asdfasdf"
    patch "/api/parks/#{@park.id}", params: @park.to_json,xhr:true
    assert_response 401
  end

  test "should  not update park when  logged in user is different from park creator " do
    sign_in()
    @park.name = "dog"
    patch "/api/parks/#{@park.id}", params: @park.to_json,xhr:true,headers: {'Authorization' => @env}
    assert_response 401
  end

  test "should   update park when  logged in user is same from park creator " do
    sign_in()
    park = Park.create({
      name: "MyString",
      description: "MyText",
      cover: "MyString",
      images: "MyString",
      avatar: "MyString",
      address_line_1: "MyString",
      address_line_2: "MyString",
      post_code: "MyString",
      user: @user
    })
    park.name = "dog"
    patch "/api/parks/#{park.id}", params: park.to_json,xhr:true,headers: {'Authorization' => @env}  
    assert_response 200
  end
  test "should destroy park" do
    sign_in()
    park = Park.create({
      name: "MyString",
      description: "MyText",
      cover: "MyString",
      images: "MyString",
      avatar: "MyString",
      address_line_1: "MyString",
      address_line_2: "MyString",
      post_code: "MyString",
      user: @user
    })

    assert_difference('Park.count', -1) do
      delete "/api/parks/#{park.id}",xhr:true,headers: {'Authorization' => @env}  
    end

    assert_response :success
  end
  test "should not destroy park when not logged in" do
    # sign_in()
    park = Park.create({
      name: "MyString",
      description: "MyText",
      cover: "MyString",
      images: "MyString",
      avatar: "MyString",
      address_line_1: "MyString",
      address_line_2: "MyString",
      post_code: "MyString",
      user: @user
    })

    assert_difference('Park.count', 0) do
      delete "/api/parks/#{park.id}",xhr:true
    end

    assert_response 401
  end

  test "Should get Park" do 
    get "/api/parks/#{@park.id}",xhr:true
    assert_response :success
  end

  

  test "Should not get Park" do 
    get "/api/parks/123434",xhr:true
    assert_response 404
  end

  test "Should success with limit for Park List" do 

    get "/api/parks",xhr:true,params:{:limit=>10}
    assert_response :success
  end

  test "Should Fail with limit for Park List" do 

    get "/api/parks",xhr:true,params:{:order_by=>10}
    assert_response :error
  end


  # test "Should rais exception without limit for Park List" do 

  #   get "/api/parks",xhr:true
  #   # assert_response :error
  # end

  # test "should not create park when not logged in " do
  #   # auth = post '/api/auth/login',params:{email:@user.email,password:'1234567'}
  #   sign_in()
  #   assert_no_difference('Park.count') do
  #     post '/api/parks', params: { user_id:@user.id,address_line_1: "asdf", address_line_2: "adsf", avatar: "@park.avatar", cover: "@park.cover", description: "@park.description", images: "@park.images", name: "@park.name", post_code: "@park.post_code" },headers: {'Authorization' => @env},xhr:true
  #     # puts @response.body
  #   end
  #   # assert_redirected_to park_url(Park.last)
  # end

  # test "should show park" do
  #   get park_url(@park)
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get edit_park_url(@park)
  #   assert_response :success
  # end

  # test "should update park" do
  #   patch park_url(@park), params: { park: { address_line_1: @park.address_line_1, address_line_2: @park.address_line_2, avatar: @park.avatar, cover: @park.cover, description: @park.description, images: @park.images, name: @park.name, post_code: @park.post_code } }
  #   assert_redirected_to park_url(@park)
  # end


end
