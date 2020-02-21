# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"


Flat.destroy_all
Planet.destroy_all
User.destroy_all


moon = Planet.create!(title: "Moon", description: "C’est la lune")
moon.save!

user = User.new(first_name: "user", last_name: "last", phone_number: "0615385223", email: "alice@gmail.com", password: "azerty")


file = URI.open("https://res.cloudinary.com/dpdzk7keq/image/upload/v1582194397/SwFs1sqQmv8yj2tbXCbUzVZu.jpg")
flat = Flat.new(name: "appart01", planet: mars, capacity: 3, description: "the place to be, on mars", price: 200.0, user: user)
flat.photo.attach(io: file, filename: "mars.jpg", content_type: "image/jpg")
flat.save!

file = URI.open("https://res.cloudinary.com/dpdzk7keq/image/upload/v1582194397/SwFs1sqQmv8yj2tbXCbUzVZu.jpg")
flat2 = Flat.new(name: "appart02", planet: moon, capacity: 30, description: "the place to be, on the moon", price: 100.0, user: user)
flat2.photo.attach(io: file, filename: "mars.jpg", content_type: "image/jpg")
flat2.save!

