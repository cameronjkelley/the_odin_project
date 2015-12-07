require 'test_helper'

class ApplicationHelperTest < ActiveSupport::TestCase
  test "full title helper" do 
    assert_equal full_title("Sign up"), "Sign up | Ruby on Rails Tutorial Sample App"
    assert_equal full_title("Help"), "Help | Ruby on Rails Tutorial Sample App"
  end
end