class TeamDailyWorkloadController < ApplicationController
  def chart
    @team_daily_workloads = TeamDailyWorkload.all
  end
end
