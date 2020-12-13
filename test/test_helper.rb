ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
 
end
module SignInHelper
  def sign_in()
    @user= User.create({
      username:"test one",
      email:"asdfs",
      password:"1234567",
      password_confirmation: '1234567'
    })
    post '/api/auth/login', params:{auth:{email:@user.email,password:@user.password}}, xhr: true
    @env = JSON.parse(@response.body)['jwt']
  end
end
class ActionDispatch::IntegrationTest
  include SignInHelper
end