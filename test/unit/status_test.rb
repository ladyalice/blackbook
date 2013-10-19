require 'test_helper'

class StatusTest < ActiveSupport::TestCase
  test "a status requires content to be entered" do 
    status = Status.new
    assert !status.save
    assert !status.errors[:content].empty?
  	
  end

  test "that status content is at least 2 characters long" do
    status = Status.new
    status.content = "A"
    assert !status.save
    #assert below will check what the status is, and if it's empty it will return a fail (false)
    assert !status.errors[:content].empty?
  end

  test "that a status has a user id" do
    status = Status.new
    status.content = "Hello"
    assert !status.save
    assert !status.errors[:user_id].empty?
  end

end
