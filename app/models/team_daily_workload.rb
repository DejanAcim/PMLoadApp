class TeamDailyWorkload < ApplicationRecord

	def index
		@workloads = Workload.unconfirmed # .group(:date)
		@team_scores = @workloads.sum(:score)
	end

	def uncofirmed_workloads_by_date
		Workload.unconfirmed
	end

	def unconfirmed_team_daily_workload_score
				uncofirmed_workloads_by_date.group(:date).sum(:score)/uncofirmed_workloads_by_date.count
	end

	def scores

	end

end
