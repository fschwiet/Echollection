require 'test_helper'

def assert_at_register_form
	assert_select "input[name='user[name]']"
	assert_select "input[name='user[email]']"
	assert_select "input[name='user[password]']"
	assert_select "input[type='submit'][value='Create account']"
end

class UsersControllerTest < ActionController::TestCase
  test "should be able to create an account" do
  	get :new
  	assert_at_register_form
  end
end
