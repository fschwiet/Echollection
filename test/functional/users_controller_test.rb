require 'test_helper'
#require 'assertions'

def assert_at_register_form
  assert_select "input[name='user[name]']"
  assert_select "input[name='user[email]']"
  assert_select "input[name='user[password]']"
  assert_select "input[name='user[password_confirmation]']"
  assert_select "input[type='submit'][value='Create account']"
end

class UsersControllerTest < ActionController::TestCase

  SOME_PASSWORD = 'accuallyWasDolan'

  test "should be able to create an account" do
    get :new
    assert_at_register_form

    @password = SOME_PASSWORD

    post :create, :user => { 
      name: 'gooby', 
      email: 'gooby@please.com', 
      password: SOME_PASSWORD, 
      password_confirmation: SOME_PASSWORD}   
      
    assert_redirected_to :root      
    should_be_logged_in_as 'gooby'
  end

  test "should receive error when registration form is not filled correctly" do
    post :create, :user => { 
      name: 'gooby', 
      email: 'gooby', 
      password: SOME_PASSWORD, 
      password_confirmation: SOME_PASSWORD}   

    assert_select "div#error_explanation", "Email should look like an email address."
  end

  test "should skip registration page if signed in" do

    UserSession.create(users(:ben))

    get :new
    assert_redirected_to :root      
    should_be_logged_in_as 'ben'
  end
end
