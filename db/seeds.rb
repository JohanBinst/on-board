# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

puts "Removing trips and users..."
Trip.destroy_all
User.destroy_all
puts "All trips and users removed ..."

puts "Creating users and save to database"

names = %w(Anthony Shannaz Tan Johan)

names.each do |name|
  email = "#{name.downcase}@gmail.com"
  new_user = User.new(email:, password: "password", first_name: name, last_name: "Last")
  new_user.save!
end

def create_name
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
  names.sample
end

def create_activity
  activities = [
    "Snorkeling",
    "Kayaking",
    "Paddleboarding",
    "Surfing",
    "Fishing",
    "Sailing",
    "Jet-Skiing",
    "Beachcombing",
    "Spearfishing"
  ]
  activities.sample
end

def create_destination
  Trip::DESTINATION.sample
end

# def create_departure_point
#   departure_points =
#   departure_points.sample
# end




def create_description
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
  descriptions.sample
end

puts "Creating 10 trips ..."
1.times do |i|
  activity = Trip::ACTIVITIES.sample((1..3).to_a.sample)
  # photo = URI.open("https://source.unsplash.com/random/1920x1080/?#{activity}")
  user = User.all.sample
  departure_point = Trip::DEPARTURE.keys.sample
  departure_date_time = Faker::Time.between_dates(from: Date.today + 1, to: Date.today + 7, period: :morning) #=> "2014-09-19 08:07:52 -0700"
  attributes_hash = {
    name: create_name,
    activity_type: activity,
    description: create_description,
    destination: create_destination,
    departure_point: departure_point,
    latitude: Trip::DEPARTURE[departure_point][:lat],
    longitude: Trip::DEPARTURE[departure_point][:lng],
    departure_date_time: departure_date_time,
    price: (100..1000).to_a.sample,
    seats: (1..20).to_a.sample,
    features: Trip::FEATURES_LIST.sample(rand(Trip::FEATURES_LIST.count) + 1),
    user_id: user.id,
  }

  new_trip = Trip.new(attributes_hash)

  blobs_array = []
 2.times do |n|
    puts "looking for photos, photo #{n + 1}/4"
    photo = URI.open("https://source.unsplash.com/random/1920x1080/?#{activity}")
    blob = { io: photo, filename: "#{i}.jpg", content_type: "image/jpg" }
    blobs_array << blob
  end
  puts "attaching photos"
  new_trip.photos.attach(blobs_array)
  thumbnail = URI.open("https://source.unsplash.com/random/1920x1080/?#{activity}")
  new_trip.thumbnail.attach(io: thumbnail, filename: "thumbnail.jpg", content_type: "image/jpg")
  puts "trip thumbnail attached"
  new_trip.save!
  puts "created trip #{i + 1}/10"
end

p "10 trips created"
