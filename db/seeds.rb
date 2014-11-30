# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

users = CSV.read('db/learner-locations.csv')
users.each_with_index do |user, count|
	sleep 1 if count % 5 == 0
	greater_us = false
	if user[2].start_with?('Greater') && user[2].end_with?('Area, US')
		user[2] = user[2][8...user[2].index(' Area')] + ", US"
		greater_us = true
	end
	location = Geokit::Geocoders::GoogleGeocoder.geocode user[2]
	country = location.country
	state = location.state_name
	city = if greater_us
			 "Greater " + location.city + " Area"
		   else
			 location.city
		   end
	if country.nil? && user[2].include?(",")
		location_array = user[2].split(", ")
		city = location_array[0]
		country = location_array[1]
	end

	User.create!(first_name:  	user[0],
			 	 last_name:		user[1],
             	 country: 		country,
             	 state:         state,
             	 city: 			city)
end
