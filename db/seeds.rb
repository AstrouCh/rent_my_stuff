# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
require 'open-uri'


User.destroy_all
Category.destroy_all
Item.destroy_all
Booking.destroy_all

20.times do
  user = User.new(email: Faker::Internet.email, password: Faker::Internet.password(min_length: 8), first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.sentence(word_count: 8), address: Faker::Address.city, phone_number: "+447917730793")
  file = URI.open(Faker::Avatar.image)
  user.photo.attach(io: file, filename: "#{Faker::Internet.password(min_length: 5)}.png", content_type: 'image/png')
  user.save!
end

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

40.times do
  item = Item.new(price: rand(1..40), title: Faker::Appliance.equipment, location: Faker::Address.city, description: Faker::Lorem.sentence(word_count: 7), category: Category.find(rand(1..6)),  user: User.last)
  3.times do
    file = URI.open("https://loremflickr.com/620/540/stuff")
    item.photos.attach(io: file, filename:  "#{Faker::Internet.password(min_length: 5)}.png", content_type: 'image/png')
  end
  item.save!
end

first_booking = Booking.new(item: Item.first, user: User.first, start_date: Time.now, end_date: Time.now)
first_booking.save!

last_booking = Booking.new(item: Item.last, user: User.last, start_date: Time.now, end_date: Time.now)
last_booking.save!
