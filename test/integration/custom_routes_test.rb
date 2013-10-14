require 'test_helper'

class CustomRoutesTest < ActionDispatch::IntegrationTest
  test "that signin route opens the signin page" do
  	get '/signin'
    assert_response :success
  end

   test "that register route opens the signin page" do
  	get '/register'
    assert_response :redirect
    assert_redirected_to "/"
  end

  test "that signup route opens the signin page" do
  	get '/signout'
    assert_response :redirect
    assert_redirected_to "/"
  end
end
