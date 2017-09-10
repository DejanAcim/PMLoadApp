require 'test_helper'

class TeamDailyWorkloadControllerTest < ActionDispatch::IntegrationTest
  test "should get chart" do
    get team_daily_workload_chart_url
    assert_response :success
  end

end
