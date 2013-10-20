# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.destroy_all

users = User.create([
	{name: 'Chris Spears', username: 'cspears', password: 'blah', number_reviews: 0}
])

Review.create([
	{rating: 3.5, body: "A great place for all things horror!", user: users.first}
])
