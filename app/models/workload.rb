class Workload < ApplicationRecord
	belongs_to :user

	default_scope { order(created_at: :desc)}

	def self.daily_availability # dodać argument (date)
		# @date = date
		where("date >= ?", Time.zone.today).count/3.0 # zamiast today dać @date
	end
end
