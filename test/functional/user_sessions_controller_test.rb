require 'test_helper'

class UserSessionsControllerTest < ActionController::TestCase
  test "can create a new account" do
    get :new
    assert_select "input[name='user_session[email]']"
    assert_select "input[name='user_session[password]']"

    post :create, :user_session => { email: 'bjohnson@server.com', password: 'benrock'}
    assert user_session = UserSession.find
    assert_equal users(:ben), user_session.user
    assert_redirected_to :root      
  end
end
