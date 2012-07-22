require 'test_helper'

class LoginToCreateNoteTest < ActionDispatch::IntegrationTest

  fixtures :all

  test "Should show username if user is logged in" do
    UserSession.create(users(:ben))

    get "/"
    should_be_logged_in_as 'ben'
    assert_select "*", /.*Welcome, ben.*/
  end

  test "Can log in to create a note" do
    get "/notes/new"
    assert_equal "user_sessions/new", path
    
  end
end
