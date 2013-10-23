require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: users(:phil).profile_name
    assert_response :success
    assert_template 'profiles/show'
  end

  test "should render a 404 on profile not found" do
  	get :show, id: "madeupname"
  	assert_response :not_found
  	
  end

  test "that variables are assigned on successful profile viewing" do
    get :show, id: users(:phil).profile_name
    #assigns makes ure instance variable and controllers are properly set
    assert assigns(:user)  
    #method below makes sure array has one or more items and that it's not empty
    assert_not_empty assigns(:statuses)
  end	

  test "only shows the correct user's status" do
  	get :show, id: users(:phil).profile_name
  	assigns(:statuses).each do |status|
  	  assert_equal users(:phil), status.user
    end
  end
    


end
