require 'test_helper'

class LoginToCreateNoteTest < ActionDispatch::IntegrationTest

  fixtures :all

  test "Can log in to create a note" do
    get_via_redirect "/notes/new"
    assert_equal "/user_sessions/new", path
    assert_equal "hi", session[:return_to]
    
    post_via_redirect "/user_sessions", :user_session => { email: 'bjohnson@server.com', password: 'benrocks'}
    
    assert_equal "/notes/new", path
  end
end
