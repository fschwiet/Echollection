require 'test_helper'

class UserSessionsControllerTest < ActionController::TestCase
  test "can create a new account" do
  	get :new
  	assert_select "input[name='user_session[email]']"
  	assert_select "input[name='user_session[password]']"
  end
end
