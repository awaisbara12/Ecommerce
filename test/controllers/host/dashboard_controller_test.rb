require 'test_helper'

class Host::DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get host_dashboard_index_url
    assert_response :success
  end

end
