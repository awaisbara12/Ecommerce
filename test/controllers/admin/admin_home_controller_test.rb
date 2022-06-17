require 'test_helper'

class Admin::AdminHomeControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get admin_admin_home_home_url
    assert_response :success
  end

end
