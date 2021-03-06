require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "a user should enter a first name"  do 
    user = User.new
    #user.first_name = "John"
    assert !user.save
    assert !user.errors[:first_name].empty?
 end

   test "a user should enter a last name" do
    user = User.new
    #user.last_name = "FORRESTER"
    assert !user.save
    assert !user.errors[:last_name].empty?
 end

   test "a user should enter a profile" do
    user = User.new
    #user.profile_name = "IDUNNO"
    assert !user.save
    assert !user.errors[:profile_name].empty?

  end

  test "a user should have a unqiue profile name" do
    user = User.new
    #below links to fixtures profile name (like pulling code from css stylesheet)
    #when you add this to the validation user.rb nfile (models folder)
    #it will then pass
    user.profile_name = users(:phil).profile_name
    
    assert !user.save
    assert !user.errors[:profile_name].empty?
  end

  test "a user should have a profile name without spaces" do
    user = User.new
    #sample case below, this profile has spaces so it should fail the test pass. If not then it's a false positive test
    user.profile_name = "My profile with spaces"
    assert !user.save
    assert !user.errors[:profile_name].empty?
    assert user.errors[:profile_name].include?("must be formatted correctly.")

  end

  test "a user can have a correctly formatted profile name" do
    user = User.new(first_name: 'alice', last_name: "k", email: "asd1@asd.com")
    user.password = user.password_confirmation = "password"
    user.profile_name = 'roadpoo'
    assert user.save
    assert user.valid?


  end
end
