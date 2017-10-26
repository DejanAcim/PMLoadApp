# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

scores = 1..6
date_range = ((Date.today-10.days)..Date.today).map(&:to_s)

print "User"
7.times do
	User.create!(
		email: Faker::Internet.email,
		name: Faker::Name.first_name,
		surname: Faker::Name.last_name,
		password: 'password')
	print "."
end
puts "Users ready."

# print "Creating team's workloads"
# date_range.each do |date|
# 	TeamDailyWorkload.create!(
# 		day: date,
# 		score: rand(scores))
# 	print "."
# end
# puts ""
# puts "Workloads ready."

print "Scores"
# no checkpoints
date_range.each do |date|
	User.all.each do |user|
		3.times do
			user.workloads.create!(
				score: rand(scores),
				date: date)
			print "."
		end
	end
end
puts ""
puts "Scores ready."
