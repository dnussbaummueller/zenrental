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
  name: "Mahalaya Yoga",
  address: "Boxhagener Str. 77, 10245 Berlin",
  price_per_hour: rand(10..100),
  size_in_m2: rand(10..100),
  description: "Mahalaya means 'big temple' and is a heart place for yoga, a sacred space for you, where you can be and experience your salvation.
  After a complete renovation, the listed halls of the Schreibfeder Höfe house a hot yoga room for all the sweaty activities and another non-hot yoga room for relaxation,
   workshops and training courses. An open and cozy lobby invites you to arrive and linger. We have separate changing rooms with showers and a shop with yoga clothing
   (leggings, shorts, tops), yoga mats, yoga towels and everything a yoga heart desires.",
  user: User.first
)

file = URI.open("https://www.praguemorning.cz/wp-content/uploads/2020/02/Screenshot-2020-02-17-at-13.43.16.png")
  yoga_studio1.photos.attach(io: file, filename: "#{yoga_studio1.name}#{rand(1..100)}.png", content_type: "image/png")
file = URI.open("https://www.meatspace.cz/site/assets/files/5950/namastery-meatspace-_gl.jpg")
  yoga_studio1.photos.attach(io: file, filename: "#{yoga_studio1.name}#{rand(1..100)}.png", content_type: "image/png")
file = URI.open("http://www.detoxchutne.cz/wp-content/uploads/2016/09/namastery-studio-01.jpg")
  yoga_studio1.photos.attach(io: file, filename: "#{yoga_studio1.name}#{rand(1..100)}.png", content_type: "image/png")

  yoga_studio1.save!

yoga_studio2 = YogaStudio.new(
  name: "Hot Yoga Berlin",
  address: "Knobelsdorffstraße 34, 14059 Berlin",
  price_per_hour: rand(10..100),
  size_in_m2: rand(10..100),
  description: "Yoga & More creates the connection between yoga, body and energy work.
  In lovingly and creatively designed rooms that are available for yoga courses, body and energy treatments, Ayurveda, events and training.
  A place of the heart, where people meet who have one thing in common: an interest in encountering life in all its fullness.",
  user: User.first
)

file = URI.open("https://luxurylondon.co.uk/wp-content/uploads/2022/08/bamford-yoga-studio-london.jpg")
  yoga_studio2.photos.attach(io: file, filename: "#{yoga_studio2.name}#{rand(1..100)}.png", content_type: "image/png")
  file = URI.open("https://luxurylondon.co.uk/wp-content/uploads/2022/08/xl-hd-29-1465x1099-c-center.jpg")
  yoga_studio2.photos.attach(io: file, filename: "#{yoga_studio2.name}#{rand(1..100)}.png", content_type: "image/png")
file = URI.open("https://images.squarespace-cdn.com/content/v1/589de1e1f7e0ab05b686adbe/1612882990743-G4CUF7PVOLRLN15GANWN/20_12_02_Bamford_Capture_0135.jpg")
  yoga_studio2.photos.attach(io: file, filename: "#{yoga_studio2.name}#{rand(1..100)}.png", content_type: "image/png")

yoga_studio2.save!

yoga_studio3 = YogaStudio.new(
  name: "Enso Yoga",
  address: "Krausenstraße 28, 10117 Berlin",
  price_per_hour: rand(10..100),
  size_in_m2: rand(10..100),
  description: "The studio is located in the rooms of the old post office building, so the conversion to a spacious and light-flooded studio in a simple industrial design was correspondingly complex.
  You step out of the hustle and bustle of the street straight into the soothing tranquility of the studio. The separate changing rooms for women and men have showers, hair dryers and are big enough for you to change your clothes in a relaxed manner.
  In the quiet, peaceful massage room you can let yourself be pampered with a soothing oil massage. A cozy, open seating area invites you to relax after yoga",
  user: User.first
)

file = URI.open("https://media.tatler.com/photos/6141da906f84b7629deaadfa/16:9/w_1280,c_limit/mortimer-house.jpg")
  yoga_studio3.photos.attach(io: file, filename: "#{yoga_studio3.name}#{rand(1..100)}.png", content_type: "image/png")
file = URI.open("https://www.mortimerhouse.com/propeller/uploads/sites/3/2021/07/fullsizeoutput_4516-1400x788.jpeg")
  yoga_studio3.photos.attach(io: file, filename: "#{yoga_studio3.name}#{rand(1..100)}.png", content_type: "image/png")
file = URI.open("https://www.mortimerhouse.com/propeller/uploads/sites/3/2021/07/photo0086-scaled.jpg")
  yoga_studio3.photos.attach(io: file, filename: "#{yoga_studio3.name}#{rand(1..100)}.png", content_type: "image/png")

yoga_studio3.save!

yoga_studio4 = YogaStudio.new(
  name: "Jivamukti Yoga School",
  address: "Glogauer Str. 19, 10999 Berlin",
  price_per_hour: rand(10..100),
  size_in_m2: 120,
  description: "In February 2022 we opened a second location, also in Kreuzberg: The studio is on the ground floor of a coach house opposite the famous Markthalle 9, north of the Görlitzer Bahnhof underground station.
  In addition to a 120 sqm yoga room with underfloor heating, there is a small boutique with drinks and yoga accessories, a changing room and sufficient toilets.",
  user: User.first
)

file = URI.open("https://images.lifestyleasia.com/wp-content/uploads/sites/2/2020/09/23104002/Flowga_Home-Page-1600x900.jpg")
  yoga_studio4.photos.attach(io: file, filename: "#{yoga_studio4.name}#{rand(1..100)}.png", content_type: "image/png")
file = URI.open("https://images.squarespace-cdn.com/content/v1/5d82d3eb84358e0d7028b4ed/1586833292315-T9DHC9Q41N6TKNZW8BCV/1+copy.jpeg")
  yoga_studio4.photos.attach(io: file, filename: "#{yoga_studio4.name}#{rand(1..100)}.png", content_type: "image/png")
file = URI.open("https://images.squarespace-cdn.com/content/v1/5d82d3eb84358e0d7028b4ed/1586833386422-K99W1I766Y43DZFU557R/IMG_6040+copy.jpg")
  yoga_studio4.photos.attach(io: file, filename: "#{yoga_studio4.name}#{rand(1..100)}.png", content_type: "image/png")

yoga_studio4.save!

yoga_studio5 = YogaStudio.new(
  name: "Lagoa Yoga",
  address: "Uhlandstraße 20, 10623 Berlin",
  price_per_hour: rand(10..100),
  size_in_m2: rand(10..100),
  description: "Lagoa Yoga not only changes your body, but it also changes your life.
  With inspiring and dedicated teachers, you can let go of the demands of everyday life, find physical challenge and soothing calm.
  More and more Yoga participants leave their Yoga class with a smile on their face and a more cheerful attitude towards life.",
  user: User.first
)

file = URI.open("https://static.thehoneycombers.com/wp-content/uploads/sites/4/2014/06/The-Practice-Yoga-Studio-Canggu-Bali-2.jpg")
  yoga_studio5.photos.attach(io: file, filename: "#{yoga_studio5.name}#{rand(1..100)}.png", content_type: "image/png")
file = URI.open("https://www.uniqueretreats.com/wp-content/uploads/2018/04/radiantly-alive.jpg")
  yoga_studio5.photos.attach(io: file, filename: "#{yoga_studio5.name}#{rand(1..100)}.png", content_type: "image/png")
file = URI.open("https://balipedia.com/wp-content/uploads/2020/12/The-Practice.jpg")
  yoga_studio5.photos.attach(io: file, filename: "#{yoga_studio5.name}#{rand(1..100)}.png", content_type: "image/png")


yoga_studio5.save!

yoga_studio6 = YogaStudio.new(
  name: "Spirit Yoga Charlottenburg",
  address: "Goethestraße 2-3, 10623 Berlin",
  price_per_hour: rand(10..100),
  size_in_m2: rand(10..100),
  description: "The Spirit Yoga Studio Charlottenburg is located where the district is most beautiful: in the neighborhood of long-established shops and galleries,
  between the University of the Arts and the popular Savignyplatz. The spacious and light-flooded practice room is quiet and peaceful due to its location in the backyard of the atmospheric former post office.
  Small cafés and boutiques invite you to linger after the yoga class in the side streets of the quarter. The clocks don't go that fast here, people know each other and like to take the time for a little chat on the street.",
  user: User.first
)

file = URI.open("https://assets.website-files.com/5f7533fe3ad0a039ce5f1006/61e5bdcb3a533b35dc58292d_sol-yoga-fullres-4%20(1).jpg")
  yoga_studio6.photos.attach(io: file, filename: "#{yoga_studio6.name}#{rand(1..100)}.png", content_type: "image/png")
file = URI.open("https://assets.website-files.com/5f7533fe3ad0a039ce5f1006/5f81cf31a156d57dc408dda6_AzUvKS-U.jpeg")
  yoga_studio6.photos.attach(io: file, filename: "#{yoga_studio6.name}#{rand(1..100)}.png", content_type: "image/png")
file = URI.open("http://solyogaflorida.com/wp-content/uploads/2018/05/studio-hero-v2.jpg")
  yoga_studio6.photos.attach(io: file, filename: "#{yoga_studio6.name}#{rand(1..100)}.png", content_type: "image/png")

yoga_studio6.save!

yoga_studio7 = YogaStudio.new(
  name: "Yogatribe Berlin Mitte",
  address: "Große Hamburger Str. 19a, 10178 Berlin",
  price_per_hour: rand(10..100),
  size_in_m2: rand(10..100),
  description: "Yogatribe is the Anusara Yoga Studio in the heart of Berlin, at Hackescher Markt.",
  user: User.first
)

file = URI.open("https://prajnayoga.com/wp-content/uploads/2022/08/prajna-studio-1518x1502.jpg")
  yoga_studio7.photos.attach(io: file, filename: "#{yoga_studio7.name}#{rand(1..100)}.png", content_type: "image/png")
file = URI.open("https://cdn.fs.teachablecdn.com/Wd72lSsvRFKD93jp4fUC")
  yoga_studio7.photos.attach(io: file, filename: "#{yoga_studio7.name}#{rand(1..100)}.png", content_type: "image/png")
file = URI.open("https://prajnayoga.com/wp-content/uploads/2020/04/20181028_Anatomy_Of_The_Vayus_DSC0254-1-scaled-1.jpg")
  yoga_studio7.photos.attach(io: file, filename: "#{yoga_studio7.name}#{rand(1..100)}.png", content_type: "image/png")


yoga_studio7.save!

yoga_studio8 = YogaStudio.new(
  name: "YOGA SKY",
  address: "Am Tempelhofer Berg 7d, 10965 Berlin",
  price_per_hour: rand(10..100),
  size_in_m2: 500,
  description: "On a generous 500 square meters, we offer you a place to develop yourself and to experience your freedom in two large studios,
  four therapy rooms and an open lounge - Experience Freedom.",
  user: User.first
)

file = URI.open("https://concreteplayground.com/content/uploads/2017/07/Yoga213-image_simonshiffphotographer.jpg")
  yoga_studio8.photos.attach(io: file, filename: "#{yoga_studio8.name}#{rand(1..100)}.png", content_type: "image/png")
file = URI.open("https://cdn.concreteplayground.com/content/uploads/2015/11/Yoga-213-Hip-Hop-Richmond-Melbourne-01-1920x1080.jpeg")
  yoga_studio8.photos.attach(io: file, filename: "#{yoga_studio8.name}#{rand(1..100)}.png", content_type: "image/png")
file = URI.open("http://amodernwayfarer.files.wordpress.com/2013/05/yoga-123-4.jpg")
  yoga_studio8.photos.attach(io: file, filename: "#{yoga_studio8.name}#{rand(1..100)}.png", content_type: "image/png")

yoga_studio8.save!

yoga_studio9 = YogaStudio.new(
  name: "Kalaa Yoga Berlin",
  address: "Lychener Str. 47, 10437 Berlin",
  price_per_hour: rand(10..100),
  size_in_m2: rand(10..100),
  description: "KALAA Yoga Berlin is a yoga school in Prenzlauer Berg, right on Helmholzplatz.
  Our studio is located in the back house of a historical Berlin building, in a former printing company with a view into the greenery.",
  user: User.first
)

file = URI.open("https://img.theculturetrip.com/wp-content/uploads/2017/04/003-133_bear.jpg")
  yoga_studio9.photos.attach(io: file, filename: "#{yoga_studio9.name}#{rand(1..100)}.png", content_type: "image/png")
file = URI.open("https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1d/ec/f0/e6/surf-spirit.jpg?w=1400&h=-1&s=1")
  yoga_studio9.photos.attach(io: file, filename: "#{yoga_studio9.name}#{rand(1..100)}.png", content_type: "image/png")
file = URI.open("https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1d/ec/f1/41/surf-spirit.jpg?w=1100&h=-1&s=1")
  yoga_studio9.photos.attach(io: file, filename: "#{yoga_studio9.name}#{rand(1..100)}.png", content_type: "image/png")

yoga_studio9.save!

yoga_studio10 = YogaStudio.new(
  name: "Element Yoga",
  address: "Pfuelstraße 5, 10997 Berlin",
  price_per_hour: rand(10..100),
  size_in_m2: rand(10..100),
  description: "The Element Yoga Institute is located in Berlin-Kreuzberg at the Schlesisches Tor with a view of the TV tower.
  Yoga classes, workshops, events and the presence dates of our training take place in our large, bright rooms.
  This is where our live streams are shot and the yoga videos for our online studio are produced.",
  user: User.first
)

file = URI.open("https://images.squarespace-cdn.com/content/v1/5bc9338d2727be3db78aefe5/1660213961233-ICKXITIKSE5VG83CQMKC/PowerLiving-12.jpg?format=2500w")
  yoga_studio10.photos.attach(io: file, filename: "#{yoga_studio10.name}#{rand(1..100)}.png", content_type: "image/png")
file = URI.open("https://images.squarespace-cdn.com/content/v1/5bc9338d2727be3db78aefe5/1660214392936-XNSWG4Y7I98FKL403TAS/PowerLiving-10.jpg")
  yoga_studio10.photos.attach(io: file, filename: "#{yoga_studio10.name}#{rand(1..100)}.png", content_type: "image/png")
file = URI.open("https://images.squarespace-cdn.com/content/v1/5bc9338d2727be3db78aefe5/2d2bfc7e-0d4a-4d32-ac80-a856d967279d/Communitea+%281%29.jpg")
  yoga_studio10.photos.attach(io: file, filename: "#{yoga_studio10.name}#{rand(1..100)}.png", content_type: "image/png")

yoga_studio10.save!

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
