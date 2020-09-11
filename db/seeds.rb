# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: "test3@test.com", name: "Keisha", password: "testtest")
User.create(email: "test4@test.com", name: "Andrew", password: "testtest")
User.create(email: "test5@test.com", name: "Blair", password: "testtest")
City.create(name: "London", country_id: 1)
City.create(name: "New Orleans", country_id: 2)
City.create(name: "Cincinnati", country_id: 3)
City.create(name: "Miami", country_id: 4)
Country.create(name: "England")
Country.create(name: "USA")
Country.create(name: "USA")
Country.create(name: "USA")
Destination.create(user_id: 1, city_id: 2, rating: 5, fave_attraction: "London Eye", comment: "One of my favorite cities ever! Hope to visit again someday.")
Destination.create(user_id: 1, city_id: 3, rating: 3, fave_attraction: "Bourbon St.", comment: "Cool city. Would've rated higher if my wallet wasn't stolen. Watch out for pickpockets!")
Destination.create(user_id: 2, city_id: 1, rating: 4, fave_attraction: "The Wheel", comment: "Fun place to visit! But a little too crowded and noisy for me.")
Destination.create(user_id: 3, city_id: 4, rating: 5, fave_attraction: "South Beach", comment: "Amazing! Highly recommend!")