# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

puts "Removing trips and users..."
Trip.destroy_all
User.destroy_all
puts "All trips and users removed ..."

puts "Creating users and save to database"

users = {
  Anthony: { first_name: "Anthony", last_name: "Marion", profile_picture: 'app/assets/images/anthony.jpeg' },
  Tan: { first_name: "Tan", last_name: "Nguyen", profile_picture: 'app/assets/images/tan.jpeg' },
  Johan: { first_name: "Johan", last_name: "Binst", profile_picture: 'app/assets/images/johan.jpeg' }
}

users.each do |key, value|
  email = "#{key.to_s.downcase}@gmail.com"
  new_user = User.new(email:, password: "password", first_name: key.to_s, last_name: value[:last_name])
  profile_picture = File.open(Rails.root.join(value[:profile_picture]))
  new_user.profile_picture.attach(io: profile_picture, filename: "#{key.to_s.downcase}.jpeg", content_type: "image/jpeg")
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

descriptions = {
  Snorkeling: "Explore the vibrant coral reefs and diverse marine life of New Caledonia through snorkeling. With crystal clear waters and stunning coral formations, snorkeling is a must-do activity for anyone visiting the islands. Swim alongside colorful schools of fish, turtles, and even dolphins as you discover the underwater world.",
  Kayaking: "Discover the tranquil bays and hidden coves of New Caledonia by kayak. Paddle through calm waters and explore secluded beaches, mangrove forests, and breathtaking scenery. Whether you're a beginner or an experienced paddler, kayaking is the perfect way to experience the natural beauty of the islands.",
  Paddleboarding: "Experience the beauty of New Caledonia from a new perspective by stand-up paddleboarding. Glide across the crystal clear waters and take in stunning views of the coastline, mountains, and coral reefs. Suitable for all ages and fitness levels, paddleboarding is a great way to get active while enjoying the island's breathtaking scenery.",
  Surfing: "Experience the thrill of riding some of the best waves in the world in New Caledonia. With world-class breaks and consistent surf conditions, the islands are a surfer's paradise. Whether you're a beginner or a seasoned pro, there are plenty of waves to suit all levels of experience.",
  Kiteboarding: "Soar above the waves and experience the ultimate adrenaline rush with kiteboarding. New Caledonia's strong and consistent trade winds provide the perfect conditions for this high-flying sport. Whether you're a beginner or an experienced kiteboarder, the islands offer a range of spots to suit all levels.",
  Windsurfing: "Ride the wind and waves with windsurfing in New Caledonia. With perfect conditions for the sport, the islands are a mecca for windsurfers from around the world. Experience the thrill of gliding across the water and feel the rush of the wind in your sails as you explore the coastline.",
  Diving: "Explore the incredible underwater world of New Caledonia with scuba diving. With an abundance of coral reefs, shipwrecks, and marine life, the islands are a diver's paradise. Discover schools of colorful fish, sharks, rays, and other incredible marine creatures in some of the clearest waters in the world.",
  # Wingfoiling: "Experience the latest watersport craze with wingfoiling in New Caledonia. With its perfect conditions of strong trade winds and calm waters, the islands are the ideal location for this thrilling activity. Soar above the water with a foil board and wing, feeling the wind in your hair and taking in the stunning views.",
  Wakeboarding: "Get your adrenaline pumping with wakeboarding in New Caledonia. With warm waters and perfect conditions for the sport, the islands offer a range of spots for wakeboarders of all levels. Enjoy the thrill of carving through the water and launching off wakes as you explore the coastline.",
  Fishing: "Experience the rich fishing culture of New Caledonia by heading out on a fishing trip. With a diverse range of fish species, from tuna and marlin to barracuda and mahi-mahi, there's always a great catch to be had. Whether you're an experienced angler or a beginner, the islands offer a range of fishing experiences to suit all levels.",
  Sailing: "Experience the beauty of New Caledonia from the water with a sailing trip. With a range of sailboats and catamarans available for hire, you can explore the islands at your own pace. Discover secluded bays, pristine beaches, and stunning landscapes as you",
  Spearfishing: "Spearfishing is a popular local activity in Hienghene, New Caledonia. Armed with a spear gun and a wetsuit, you can explore the stunning coral reefs and catch your own fish for dinner! It's an exciting and challenging way to connect with nature and test your skills. You'll also have the opportunity to learn about the local marine life and the traditional methods of fishing used by the Kanak people.",
  # Flyfishing: "Flyfishing is a unique way to experience the pristine rivers and streams of New Caledonia. In Poindimie, you can cast your line and try your luck at catching trout, mullet, or other freshwater fish. The lush forests and clear waters provide the perfect backdrop for a peaceful and relaxing day out. You'll also have the chance to learn from local experts and gain insight into the traditional fishing techniques used by the locals. Don't miss out on this unforgettable fishing adventure!"
}

def create_destination
  Trip::DESTINATION.sample
end

puts "Creating 10 trips ..."
20.times do |i|
  # photo = URI.open("https://source.unsplash.com/random/1920x1080/?#{activity}")
  user = User.all.sample
  departure_point = Trip::DEPARTURE.keys.sample
  departure_date_time = Faker::Time.between_dates(from: Date.today + 1, to: Date.today + 7, period: :morning) #=> "2014-09-19 08:07:52 -0700"
  activity = descriptions.keys.sample
  attributes_hash = {
    name: create_name,
    activity_type: [activity],
    description: descriptions[activity],
    destination: create_destination,
    departure_point: departure_point,
    latitude: Trip::DEPARTURE[departure_point][:lat],
    longitude: Trip::DEPARTURE[departure_point][:lng],
    departure_date_time: departure_date_time,
    # price: (100..1000).to_a.sample,
    price: [100, 150, 200, 250, 300, 350, 400, 450, 500].sample,
    seats: (1..20).to_a.sample,
    features: Trip::FEATURES_LIST.sample(rand(Trip::FEATURES_LIST.count) + 1),
    user_id: user.id
  }

  new_trip = Trip.new(attributes_hash)
  blobs_array = []

 4.times do |n|
    puts "looking for photos, photo #{n + 1}/4"
    photo = URI.open("https://source.unsplash.com/random/640x480/?#{activity}")
    blob = { io: photo, filename: "#{i}.jpg", content_type: "image/jpg" }
    blobs_array << blob
  end
  puts "attaching photos"
  new_trip.photos.attach(blobs_array)
  thumbnail = URI.open("https://source.unsplash.com/random/640x480/?#{activity}")
  new_trip.thumbnail.attach(io: thumbnail, filename: "thumbnail.jpg", content_type: "image/jpg")
  puts "trip thumbnail attached"
  new_trip.save!
  puts "created trip #{i + 1}/10"
end

p "20 trips created"
