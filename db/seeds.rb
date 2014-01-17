# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(first_name: 'Justin', last_name: 'Chan', email: 'hellojustinchan@gmail.com', password:'justinchan123')
User.create(first_name: 'Lucia', last_name: 'Song', email: 'lucia.song@yahoo.com', password: 'luciasong123')
User.create(first_name: 'Tony', last_name: 'Thaweethai', email: 'tony.thaweethai@gmail.com', password: 'tonythaweethai123')