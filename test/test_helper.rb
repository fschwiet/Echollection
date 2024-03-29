ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'authlogic/test_case'


def should_be_logged_in_as (name)
  assert user_session = UserSession.find, "Should have saved user session"
  assert_equal name, user_session.user.name, "Should have associated user with session"
end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
end


class ActionController::TestCase
  setup :activate_authlogic
end
