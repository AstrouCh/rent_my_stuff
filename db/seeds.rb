# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

tom = User.new(email: "tomm@gmail.com", password: "longgggpassword", first_name: "Tom", last_name: "Burns", description: "I am looking to hire a really cool thing", address: "London", phone_number: "+447917730793")
tom.save!

astrid = User.new(email: "astridchazaux@hotmail.fr", password: "astridchazaux@hotmail.fr", first_name: "Astrid", last_name: "Chazaux", description: "I have nice stuffs to rent", address: "berlin", phone_number: "+33665348376")
astrid.save!

outdoors = Category.new(name: "outdoors")
outdoors.save!

construction_tools = Category.new(name: "Construction tools")
construction_tools.save!

gardening_tools = Category.new(name: "Gardening tools")
gardening_tools.save!

videogames_tools = Category.new(name: "Videogames tools")
videogames_tools.save!

party = Category.new(name: "Party")
party.save!

surfboard = Item.new(title: "Big Mal", location: "Bondi Beach", description: "Big surfbaord mega mega big mega", user: User.first, category: Category.first)
surfboard.save!

big_speaker = Item.new(title: "Big speaker", location: "Paris", description: "Very powerful and big speakers", user: User.last, category: Category.last)
big_speaker.save!

climbing_material = Item.new(title: "Climbing Material", location: "Fontainebleau", description: "Mattress, shoes and ropes", user: User.last, category: Category.first)
climbing_material.save!

circular_saw = Item.new(title: "Circular Saw", location: "Fontainebleau", description: "Amazingly cutting stuff", user: User.last, category: Category.first)
circular_saw.save!


first_booking = Booking.new(item: Item.first, user: User.first, start_date: Time.now, end_date: Time.now)
first_booking.save!

last_booking = Booking.new(item: Item.last, user: User.last, start_date: Time.now, end_date: Time.now)
last_booking.save!

first_review = Review.new(content: "Very good item! Mega mega good mega", rating: 4, booking: Booking.first)
first_review.save!

last_review = Review.new(content: "Bad item! Mega mega badddd mega", rating: 4, booking: Booking.last)
last_review.save!
