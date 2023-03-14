# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


tom = User.new(email: "tomm@gmail.com", password: "longgggpassword", first_name: "Tom", last_name: "Burns", description: "I am looking to hire a really cool thing", address: "London", phone_number: "+447917730793")
tom.save!

outdoors = Category.new(name: "outdoors")
outdoors.save!

surfboard = Item.new(title: "Big Mal", location: "Bondi Beach", description: "Big surfbaord mega mega big mega", user: User.last, category: Category.last)
surfboard.save!

best_one = Favourite.new(user: User.last, title: "Best Surfboard", item: Item.last)
best_one.save!

first_booking = Booking.new(item: Item.last, user: User.last, start_date: Time.now, end_date: Time.now)
<<<<<<< HEAD
first_booking.save

outdoor = Category.new(name: "outdoor")
outdoor.save!
=======
first_booking.save!

first_review = Review.new(content: "Very good item! Mega mega good mega", rating: 4, booking: Booking.last)
first_review.save!
>>>>>>> master
