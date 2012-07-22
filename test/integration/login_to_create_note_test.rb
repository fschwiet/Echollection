require 'test_helper'

class LoginToCreateNoteTest < ActionDispatch::IntegrationTest

  fixtures :all

  test "Can log in to create a note" do
    get "/notes/new"
    assert_equal "user_sessions/new", path
    
  end
end
