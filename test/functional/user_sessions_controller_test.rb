require 'test_helper'

class UserSessionsControllerTest < ActionController::TestCase
  test "should be able to login" do
    get :new
    assert_select "input[name='user_session[email]']"
    assert_select "input[name='user_session[password]']"

    post :create, :user_session => { email: 'bjohnson@server.com', password: 'benrocks'}
    assert_redirected_to :root      
    assert user_session = UserSession.find, "Should have saved user session"
    assert_equal users(:ben), user_session.user, "Should have associated user with session"
  end

  test "should receive error when using invalid username" do
  end

end
