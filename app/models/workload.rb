class Workload < ApplicationRecord
	belongs_to :user

	scope :unconfirmed, ->{ where(confirmed: [nil, false])}
	default_scope { order(created_at: :desc)}

	def self.uncnf_score_by_date(date)
		chosen_day = Workload.unconfirmed.where(date: date)
  	(chosen_day.sum(:score) / (chosen_day.count * 1/3))/3.0
	end

	def self.team_daily_workload(date)
		total_score = Workload.where(date: date).sum(:score)
		availability = Workload.where(date: date).count/3.0
		total_score / availability
	end
end
