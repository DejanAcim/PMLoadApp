class TeamDailyWorkloadController < ApplicationController
  def chart
    @team_daily_workloads = TeamDailyWorkload.all
  end

  def index
    @unconfirmed_workloads = Workload.where(confirmed: false)
  end

  def confirm
    # @team_daily_workload = TeamDailyWorkload.create(team_daily_workload_params)
    # @team_daily_workload.score =
  end
end
