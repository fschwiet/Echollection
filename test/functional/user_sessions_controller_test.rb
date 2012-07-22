require 'test_helper'

def assert_at_login_form
    assert_select "input[name='user_session[email]']"
    assert_select "input[name='user_session[password]']"
    assert_select "input[type='submit'][value='Login']"
end

class UserSessionsControllerTest < ActionController::TestCase

  test "should be able to login" do
    get :new
    assert_at_login_form

    post :create, :user_session => { email: 'bjohnson@server.com', password: 'benrocks'}
    assert_redirected_to :root      
    should_be_logged_in_as "ben"
  end

  test "should receive error when using invalid username" do
    post :create, :user_session => { email: 'bjohnson@.com', password: 'benrocks'}
    assert_at_login_form
    assert_select "div#error_explanation"
  end

  test "should skip login page if signed in" do

    UserSession.create(users(:ben))

    get :new
    assert_redirected_to :root      
    should_be_logged_in_as 'ben'
  end
end
