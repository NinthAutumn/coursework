require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end
  test "Should login user" do
    @user = User.create({
      username:"username",
      password:"1234567",
      email:"test@gmail.com",
      password_confirmation:"1234567"
    })
    post '/api/auth/login',xhr:true,params:{auth:{email:@user.email,password:@user.password}}
    assert JSON.parse(@response.body)['jwt'].present?
    assert_response :success
  end

  test "Should Not login user" do
    @user = User.create({
      username:"username",
      password:"1234567",
      email:"test@gmail.com",
      password_confirmation:"1234567"
    })
    post '/api/auth/login',xhr:true,params:{auth:{email:@user.email,password:'adfasd'}}
    # assert_not 
    assert_equal "", @response.body
    assert_response 404
  end

  test "Should create user" do
    assert_difference('User.count') do
      post '/api/auth/signup',xhr:true,params:{
        username:"username",
        password:"1234567",
        email:"test@gmail.com",
        password_confirmation:"1234567"
      }
    end
    assert JSON.parse(@response.body)['id'].present?
    assert_response :success
  end

  test "Should not create with different password and password_confirmation user" do
    assert_no_difference('User.count') do
      post '/api/auth/signup',xhr:true,params:{
        username:"username",
        password:"1234567",
        email:"test@gmail.com",
        password_confirmation:"2234"
      }
    end
    assert_equal "Password confirmation doesn't match Password", JSON.parse(@response.body)['messages'][0]
    assert_response 409
  end

  test "Should not create without  password" do
    assert_no_difference('User.count') do
      post '/api/auth/signup',xhr:true,params:{
        username:"username",
        email:"test@gmail.com",
      }
    end
    assert_equal "Password can't be blank", JSON.parse(@response.body)['messages'][0]
    assert_response 409
  end

  test "Should not create without  email" do
    assert_no_difference('User.count') do
      post '/api/auth/signup',xhr:true,params:{
        username:"username",
        password:"1234567",
        password_confirmation:"1234567"
      }
    end
    assert_equal "Email can't be blank", JSON.parse(@response.body)['messages'][0]
    assert_response 409
  end

  test "fetch user me " do
    sign_in()
    get '/api/users/self/show', headers:{Authorization:@env}
    assert_response :success
    assert_equal @user.id,JSON.parse(@response.body)['id']
  end

  test "fail fetch user me " do
    sign_in()
    get '/api/users/self/show'
    assert_response 401
    
    assert_equal "", @response.body
  end

  test "Fetch specific user " do
    get "/api/users/123412341234"
    assert_response 404
    # assert_equal @user.id, JSON.parse(@response.body)['id']
  end


end
