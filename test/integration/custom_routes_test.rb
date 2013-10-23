require 'test_helper'

class CustomRoutesTest < ActionDispatch::IntegrationTest
  test "that signin route opens the signin page" do
    get '/signin'
    assert_response :success
  end

  test "that register route opens the signup page" do
    get '/signup'
    assert_response :success
  end

  test "that signup route opens the signin page" do
    get '/signout'
    assert_response :redirect
    assert_redirected_to "/"
  end

  test "test a profile page works" do
    get '/roadpoo'
    assert_response :success
  end
end
