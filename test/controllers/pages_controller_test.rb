require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get '/'
    assert_response :success
  end

  test "should not post contact" do
    assert_raise(Exception){ post '/contact'} 
  end

  test "should  post contact" do
    post '/contact', params: { content:"asdfdsf", subject:"adsf"}
    assert_response :success
  end

  

end
