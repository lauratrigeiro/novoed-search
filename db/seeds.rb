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
learner_locations = CSV.read('db/learner-locations.csv')


LearnerLocation.create!(name:  "Example User",
             country: "United States",
             state:              "California",
             city: "San Francisco")

LearnerLocation.create!(name:  learner_locations[0][0],
             country: "Hungary")