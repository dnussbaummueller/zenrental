require "open-uri"

# Creating the seed data for the database for users, yoga_studios and bookings
# 1. Create 1 user
# 2. Create 10 yoga_studios
# 3. Create 10 bookings

puts "Cleaning database..."
Booking.destroy_all
YogaStudio.destroy_all
User.destroy_all

puts "Creating users..."
users_attributes = [
  {
    email: "test@test.com",
    password: "123456"
  }
]
User.create!(users_attributes)
puts "Finished!"

puts "Creating yoga_studios..."

yoga_studio1 = YogaStudio.new(
  name: Faker::Company.unique.name,
  address: "Parkstrasse 90c, 13086 Berlin",
  price_per_hour: rand(10..100),
  size_in_m2: rand(10..100),
  description: Faker::Lorem.paragraph,
  user: User.first
)
3.times do
  file = URI.open("https://source.unsplash.com/random")
  yoga_studio1.photos.attach(io: file, filename: "#{yoga_studio1.name}#{rand(1..100)}.png", content_type: "image/png")
end
yoga_studio1.save!

yoga_studio2 = YogaStudio.new(
  name: Faker::Company.unique.name,
  address: "Chaussee Strasse 92, 10115 Berlin",
  price_per_hour: rand(10..100),
  size_in_m2: rand(10..100),
  description: Faker::Lorem.paragraph,
  user: User.first
)
3.times do
  file = URI.open("https://source.unsplash.com/random")
  yoga_studio2.photos.attach(io: file, filename: "#{yoga_studio2.name}#{rand(1..100)}.png", content_type: "image/png")
end
yoga_studio2.save!

yoga_studio3 = YogaStudio.new(
  name: Faker::Company.unique.name,
  address: "Stockumer Strasse 28, 13507 Berlin",
  price_per_hour: rand(10..100),
  size_in_m2: rand(10..100),
  description: Faker::Lorem.paragraph,
  user: User.first
)
3.times do
  file = URI.open("https://source.unsplash.com/random")
  yoga_studio3.photos.attach(io: file, filename: "#{yoga_studio3.name}#{rand(1..100)}.png", content_type: "image/png")
end
yoga_studio3.save!


puts "Finished!"

puts "Creating bookings..."
10.times do
  booking = Booking.new(
    yoga_studio: YogaStudio.all.sample,
    user: User.first,
    checkin_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
    checkout_date: Faker::Date.forward(days: 23),
    booking_status: ["pending", "accepted", "rejected"].sample
  )
  booking.save!
end

puts "Creating ratings..."


YogaStudio.all.each do |yoga_studio|
  5.times do
  review = Review.new(
    yoga_studio: yoga_studio,
    content: Faker::Quote.unique.yoda,
    rating: rand(1..5)
  )
  review.save!
  end
end

puts "Finished!"
