require 'test_helper'

class ShowLoginInfoTest < ActionDispatch::IntegrationTest
  fixtures :all

  test "Should show username if user is logged in" do
    UserSession.create(users(:ben))

    get "/notes/new"
    should_be_logged_in_as 'ben'
    assert_select "*", /.*Welcome, ben.*/
  end
=begin
  test "Should show logout link if user is logged in" do
    flunk "not implemented"
  end

  test "Should show login link if user is not logged in" do
    flunk "not implemented"
  end

  test "Should show register link if user is not logged in" do
    flunk "not implemented"
  end
=end
end
