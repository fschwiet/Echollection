require 'test_helper'

def assert_at_login_form
    assert_select "input[name='user_session[email]']"
    assert_select "input[name='user_session[password]']"
end

class UserSessionsControllerTest < ActionController::TestCase
  test "should be able to login" do
    get :new
    assert_at_login_form

    post :create, :user_session => { email: 'bjohnson@server.com', password: 'benrocks'}
    assert_redirected_to :root      
    assert user_session = UserSession.find, "Should have saved user session"
    assert_equal users(:ben), user_session.user, "Should have associated user with session"
  end

  test "should receive error when using invalid username" do
    post :create, :user_session => { email: 'bjohnson@.com', password: 'benrocks'}
    assert_at_login_form
    assert_select "div#error_explanation"
  end

end
