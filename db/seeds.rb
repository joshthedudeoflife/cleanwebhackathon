# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "CSV"

# u1 = User.create(name: "Josh Chou", username: "joshthedudeoflife")
# u2 = User.create(name: "Jeff Mekler", username: "jmekler")
# 
# c = Challenge.create(title: "Electricity challenge", description: "Reduce your energy usege at home.", start_date: "1/1/14", end_date: "4/1/14")
# c.steps.create(title: "Replace a light bulb.", description: "Be cool yo.", pledge_description: "replaced old light bulbs.", pledge_points: 10);
# c.steps.create(title: "Replace windows.", description: "Be cool yo.", pledge_description: "upgraded windows.", pledge_points: 100);
# 
# u1.memberships.create(challenge: c)
# u2.memberships.create(challenge: c)


energy_challenge = Challenge.create(title: "Make your home more efficient", description: "Use more light bulbs", start_date: Time.new(2014, 03, 29, 1, 00, 00, "+02:00"), end_date: Time.now+86400)
CSV.foreach("db/seeds/energy_steps.csv") do |row|
	title = row[0]
	description = row[2]
	points = row[1]
  puts energy_challenge.steps.create(title: title, description: description, pledge_description: "upgraded windows.", pledge_points: 100)
end

transportation_challenge = Challenge.create(title: "Driving and Commuting Habbits", description: "Join your coworkers to reduce your transportation footprint", start_date: Time.new(2014, 04, 01, 1, 00, 00, "+02:00"), end_date: Time.now+86400)
CSV.foreach("db/seeds/transportation.csv") do |row|
	title = row[0]
	description = row[2]
	points = row[1]
  puts transportation_challenge.steps.create(title: title, description: description, pledge_description: "upgraded windows.", pledge_points: 100)
end