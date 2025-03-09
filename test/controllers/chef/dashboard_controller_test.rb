require 'test_helper'

class Chef::DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get chef_dashboard_index_url
    assert_response :success
  end

end
