# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

p "Removing trips and users..."
Trip.destroy_all
User.destroy_all
p "All trips and users removed ..."

p "Creating users and save to database"

names = %w(Anthony Shannaz Tan Johan)

names.each do |name|
  email = "#{name}@feeling_blue.com"
  new_user = User.new(email:, password: "password", first_name: name, last_name: "Last")
  new_user.save!
end

p "Creating 10 trips ..."
10.times do |i|
  photo = URI.open("https://unsplash.com/s/photos/beach-activities")
  user = User.all.sample
  names = [
    "Sea Splashers",
    "Sand & Surf Adventures",
    "Beach Bums",
    "Shoreline Explorers",
    "Wave Riders",
    "Sun, Sand & Fun",
    "Coastal Adventures",
    "Beachcombers",
    "Saltwater Dreamers",
    "Sand Castles & Surfing"
  ]
  name = names.sample
  activities = [
    "Snorkeling",
    "Kayaking",
    "Paddleboarding",
    "Surfing",
    "Beach Volleyball",
    "Fishing",
    "Sailing",
    "Jet Skiing",
    "Beachcombing",
    "Sunbathing"
  ]
  activity_type = activities.sample
  destinations = [
    "Dumbea pass",
    "Ilot Tenia",
    "False pass",
    "Amédée lighthouse",
    "Outer reef",
    "Ilot Signal",
    "Ilot Maitre",
    "Ilot Goeland"
  ]
  destination = destinations.sample
  departure_point = [
    "Orphelinat Bay",
    "Aquarêve",
    "Port Plaisance",
    "Port du Sud",
    "Port Moselle",
    "Ouano",
    "Tomo"
  ]

  departure_date_time = Faker::Time.between_dates(from: Date.today + 1, to: Date.today + 7, period: :morning) #=> "2014-09-19 08:07:52 -0700"

  price = (100..1000).to_a.sample
  seats = (1..20).to_a.sample
  features_list = [
    "fishing gears",
    "first aids",
    "snorkel",
    "meals",
    "drinks",
    "speaker",
    "insurance",
    "sunsreen",
    "towels"
  ]

  features = features_list.sample(rand(features_list.count) + 1)

  descriptions = [
    "Experience the thrill of surfing and the relaxation of yoga on the beach!",
    "Join us for a day of beach volleyball, music, and fun in the sun!",
    "Snorkel in crystal clear waters and explore the vibrant marine life beneath the waves!",
    "Take a stand-up paddleboard tour and discover hidden coves and secret beaches!",
    "Sail off into the sunset on a catamaran and enjoy the stunning views of the coastline!",
    "Explore the local culture and cuisine on a beachside food and drink tour!",
    "Join a beach boot camp and challenge yourself with a high-energy workout on the sand!",
    "Try your hand at fishing and learn about the local species and techniques!",
    "Join a group for a day of kayaking, hiking, and beachcombing on a remote island!",
    "Experience the thrill of jet skiing and feel the wind in your hair as you speed across the waves!"
  ]
  description = descriptions.sample

  attributes_hash = {
    name: name,
    activity_type: activity_type,
    description: description,
    destination: destination,
    departure_point: departure_point,
    departure_date_time: departure_date_time,
    price: price,
    seats: seats,
    features: features,
    user_id: user.id
  }

  new_trip = Trip.new(attributes_hash)
  # new_trip.photo.attach(io: photo, filename: "#{i}.jpg", content_type: "image/jpg")
  new_trip.save
  puts "created trip"
end

p "10 trips created"
