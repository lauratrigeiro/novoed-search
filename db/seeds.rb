# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'
# require 'openssl'
# require 'geokit'
users = CSV.read('db/learner-locations.csv')
users.each_with_index do |user, count|
	sleep 1 if count % 5 == 0
	location = Geokit::Geocoders::GoogleGeocoder.geocode user[2]
	User.create!(first_name:  	user[0],
			 	 last_name:		user[1],
             	 country: 		location.country,
             	 state:         location.state_name,
             	 city: 			location.city)
end
