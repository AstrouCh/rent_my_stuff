# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
Category.destroy_all
Item.destroy_all
Booking.destroy_all

tom = User.new(email: "tom@gmail.com", password: "tom@gmail.com", first_name: "Tom", last_name: "Burns", description: "I am looking to hire a really cool thing", address: "London", phone_number: "+447917730793")
tom.save!

astrid = User.new(email: "astridchazaux@hotmail.fr", password: "astridchazaux@hotmail.fr", first_name: "Astrid", last_name: "Chazaux", description: "I have nice stuffs to rent", address: "berlin", phone_number: "+33665348376")
astrid.save!

outdoors = Category.new(name: "Outdoors sports", photo: "surfing-gd470ebe8f_1920.jpg")
outdoors.save!

construction_tools = Category.new(name: "Construction tools", photo: "hammer-g4eaa7667a_1920.jpg")
construction_tools.save!

camping = Category.new(name: "Camping items", photo: "tent-g2645ac2b8_1920.jpg")
camping.save!

gardening_tools = Category.new(name: "Gardening tools", photo: "computing-gecf40deaa_1920.jpg")
gardening_tools.save!

videogames_tools = Category.new(name: "Videogames tools", photo: "video-games-g295e9f211_1920.jpg")
videogames_tools.save!

party = Category.new(name: "Party", photo: "headlights-g6d3765276_1920.jpg")
party.save!

surfboard = Item.new(price: 15, title: "Big Mal", location: "Bondi Beach", description: "Big surfbaord mega mega big mega", user: User.first, category: Category.first)
surfboard.save!

big_speaker = Item.new(price: 5, title: "Big speaker", location: "Paris", description: "Very powerful and big speakers", user: User.last, category: Category.last)
big_speaker.save!

climbing_material = Item.new(price: 8, title: "Climbing Material", location: "Fontainebleau", description: "Mattress, shoes and ropes", user: User.last, category: Category.first)
climbing_material.save!

circular_saw = Item.new(price: 20, title: "Circular Saw", location: "Fontainebleau", description: "Amazingly cutting stuff", user: User.last, category: Category.first)
circular_saw.save!

first_booking = Booking.new(item: Item.first, user: User.first, start_date: Time.now, end_date: Time.now)
first_booking.save!

last_booking = Booking.new(item: Item.last, user: User.last, start_date: Time.now, end_date: Time.now)
last_booking.save!
