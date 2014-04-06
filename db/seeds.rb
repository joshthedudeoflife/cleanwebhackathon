# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "CSV"

u1 = User.create(name: "Josh Chou", username: "joshthedudeoflife")
u2 = User.create(name: "Jeff Mekler", username: "jmekler")


c = Challenge.create(title: "Reduce Energy Usage at Home", description: "<p>One of the best ways to be more sustainable is to make your home run more efficiently. Take this challenge to decrease your environmental footprint and to save money on your utility bills.</p><p>Saving energy in your home can be as quick and easy as replacing light bulbs. Earn points for:</p><ul><li>Importing energy data from your utility to see the impact of your actions</li><li>Making low-cost changes and conducting maintenance</li><li>Replacing old home appliances (for the more advanced “do-it-yourselfer”)</li><li>Achieving savings on your energy bill over time</li></ul>", start_date: Time.new(2014, 1, 1, 0, 0, 0), end_date: Time.new(2014, 4, 30, 0, 0, 0))

u1.memberships.create(challenge: c)

CSV.foreach("db/seeds/energy.csv") do |row|
	title = row[0]
	action = row[1]
	points = row[2].to_i * 10
	description = "<p>#{row[3]}</p><p>Read more at: <a href='#{row[4]}'>#{row[4]}</a>"
  c.steps.create(title: title, description: description, pledge_description: action, pledge_points: points)
end

c = Challenge.create(title: "Driving and Commuting Habbits", description: "Join your coworkers to reduce your transportation footprint", start_date: Time.new(2014, 04, 01, 1, 00, 00, "+02:00"), end_date: Time.now+86400)
CSV.foreach("db/seeds/transportation.csv") do |row|
	title = row[0]
	action = row[1]
	points = row[2].to_i * 10
	description = "<p>#{row[3]}</p><p>Read more at: <a href='#{row[4]}'>#{row[4]}</a>"
  c.steps.create(title: title, description: description, pledge_description: action, pledge_points: points)
end