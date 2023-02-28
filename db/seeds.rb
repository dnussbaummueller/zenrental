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
10.times do
  yoga_studio = YogaStudio.new(
    name: Faker::Company.unique.name,
    address: Faker::Address.unique.full_address,
    price_per_hour: rand(10..100),
    size_in_m2: rand(10..100),
    description: Faker::Lorem.paragraph,
    user: User.first
  )
  3.times do
    file = URI.open("https://source.unsplash.com/random")
    yoga_studio.photos.attach(io: file, filename: "#{yoga_studio.name}#{rand(1..100)}.png", content_type: "image/png")
  end
  yoga_studio.save!
end



puts "Finished!"

puts "Creating bookings..."
10.times do
  booking = Booking.new(
    yoga_studio: YogaStudio.all.sample,
    user: User.first,
    checkin_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
    checkout_date: Faker::Date.forward(days: 23),
    booking_status: ["pending", "accepted", "declined"].sample
  )
  booking.save!
end

puts "Finished!"
