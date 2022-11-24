require 'faker'
require 'date'

puts "Clearing database..."
Meeting.destroy_all
Survivalist.destroy_all
User.destroy_all


usernames = ["Bearclaw Mohawk", "Big Rebecca", "Captain Walker", "Crow Fishers", "Doctor Dealgood", "Feral Kid", "Mad Max", "May Swaisey", "Jim Goose"]

# change city, street and postcode to some individually chosen addresses

puts "Creating users..."
  password = "123456"
  name = usernames[0].split(" ")
  mohawk = User.create!({email: "#{name.first.downcase}.#{name.last.downcase}@rent-or-die.com", name: usernames[0], password: password, city: "Berlin"})

  mohawk.photo.attach(io: File.open("app/assets/images/mohawk.jpg"), filename: "mohawk.jpg", content_type: "image/jpg")
  
  name = usernames[1].split(" ")
  rebecca = User.create({email: "#{name.first.downcase}.#{name.last.downcase}@rent-or-die.com", name: usernames[1], password: password, city: "Berlin"})
  
  rebecca.photo.attach(io: File.open("app/assets/images/rebecca.jpg"), filename: "rebecca.jpg", content_type: "image/jpg")
  
  name = usernames[2].split(" ")
  walker = User.create({email: "#{name.first.downcase}.#{name.last.downcase}@rent-or-die.com", name: usernames[2], password: password, city: "Berlin"})
  
  walker.photo.attach(io: File.open("app/assets/images/walker.jpg"), filename: "walker.jpg", content_type: "image/jpg")
  
  name = usernames[3].split(" ")
  fishers = User.create({email: "#{name.first.downcase}.#{name.last.downcase}@rent-or-die.com", name: usernames[3], password: password, city: "Berlin"})

  fishers.photo.attach(io: File.open("app/assets/images/fishers.jpg"), filename: "fishers.jpg", content_type: "image/jpg")
  
  name = usernames[4].split(" ")
  dealgood = User.create({email: "#{name.first.downcase}.#{name.last.downcase}@rent-or-die.com", name: usernames[4], password: password, city: "Berlin"})

  dealgood.photo.attach(io: File.open("app/assets/images/dealgood.jpg"), filename: "dealgood.jpg", content_type: "image/jpg")
  
  name = usernames[5].split(" ")
  kid = User.create({email: "#{name.first.downcase}.#{name.last.downcase}@rent-or-die.com", name: usernames[5], password: password, city: "Berlin"})

  kid.photo.attach(io: File.open("app/assets/images/kid.jpg"), filename: "kid.jpg", content_type: "image/jpg")
  
  name = usernames[6].split(" ")
  max = User.create({email: "#{name.first.downcase}.#{name.last.downcase}@rent-or-die.com", name: usernames[6], password: password, city: "Berlin"})
  
  max.photo.attach(io: File.open("app/assets/images/max.jpg"), filename: "max.jpg", content_type: "image/jpg")
  
  name = usernames[7].split(" ")
  swaisey = User.create({email: "#{name.first.downcase}.#{name.last.downcase}@rent-or-die.com", name: usernames[7], password: password, city: "Berlin"})

  swaisey.photo.attach(io: File.open("app/assets/images/swaisey.jpg"), filename: "swaisey.jpg", content_type: "image/jpg")
  
  name = usernames[8].split(" ")
  goose = User.create({email: "#{name.first.downcase}.#{name.last.downcase}@rent-or-die.com", name: usernames[8], password: password, city: "Berlin"})

  goose.photo.attach(io: File.open("app/assets/images/goose.jpg"), filename: "goose.jpg", content_type: "image/jpg")

puts "Users created!"


users = User.all
categories = ["Engineer", "Medical", "Destroyer", "Cook", "Hunter"]


puts "Creating survivalists..."
    Survivalist.create({name: users[0].name, category: categories[2], skills: "Killing", street: Faker::Address.street_address, postcode: Faker::Address.zip_code, city: users[0].city, photo: users[0].photo, user_id: users[0].id})

    Survivalist.create({name: users[1].name, category: categories[4], skills: "Finding food", street: Faker::Address.street_address, postcode: Faker::Address.zip_code, city: users[1].city, photo: users[1].photo, user_id: users[1].id})

    Survivalist.create({name: users[2].name, category: categories[3], skills: "Reduce hunger", street: Faker::Address.street_address, postcode: Faker::Address.zip_code, city: users[2].city, photo: users[2].photo, user_id: users[2].id})

    Survivalist.create({name: users[3].name, category: categories[3], skills: "Producing its own food", street: Faker::Address.street_address, postcode: Faker::Address.zip_code, city: users[3].city, photo: users[3].photo, user_id: users[3].id})
    
    Survivalist.create({name: users[4].name, category: categories[1], skills: "Fast patching", street: Faker::Address.street_address, postcode: Faker::Address.zip_code, city: users[4].city, photo: users[4].photo, user_id: users[4].id})

    Survivalist.create({name: users[5].name, category: categories[4], skills: "Headshots", street: Faker::Address.street_address, postcode: Faker::Address.zip_code, city: users[5].city, photo: users[5].photo, user_id: users[5].id})

    Survivalist.create({name: users[6].name, category: categories[0], skills: "Build shelter", street: Faker::Address.street_address, postcode: Faker::Address.zip_code, city: users[6].city, photo: users[6].photo, user_id: users[6].id})

    Survivalist.create({name: users[7].name, category: categories[3], skills: "Cooking", street: Faker::Address.street_address, postcode: Faker::Address.zip_code, city: users[7].city, photo: users[7].photo, user_id: users[7].id})

    Survivalist.create({name: users[8].name, category: categories[1], skills: "Treat injuries", street: Faker::Address.street_address, postcode: Faker::Address.zip_code, city: users[8].city, photo: users[8].photo, user_id: users[8].id})
puts "Survivalists created!"


survivalists = Survivalist.all


puts "Creating meetings..."
Meeting.create({start_date: DateTime.now, end_date: DateTime.now + 1, user_id: users[0].id, survivalist_id: survivalists[0].id})
puts "Meetings created!"


puts "Database seeded!"
