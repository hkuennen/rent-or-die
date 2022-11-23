require 'faker'
require 'date'

puts "Clearing database..."
Meeting.destroy_all
Survivalist.destroy_all
User.destroy_all


usernames = ["Bearclaw Mohawk", "Big Rebecca", "Captain Walker", "Crow Fishers", "Dr. Dealgood", "Feral Kid", "Mad Max", "May Swaisey", "Jim Goose"]


puts "Creating users..."
  password = "123456"
  name = usernames[0].split(" ")
  User.create({email: "#{name.first.downcase}.#{name.last.downcase}@rent-or-die.com", name: usernames[0], password: password, city: Faker::Address.city, photo: "https://images.pexels.com/photos/3536235/pexels-photo-3536235.jpeg?auto=compress&cs=tinysrgb&w=1200"})

  name = usernames[1].split(" ")
  User.create({email: "#{name.first.downcase}.#{name.last.downcase}@rent-or-die.com", name: usernames[1], password: password, city: Faker::Address.city, photo: "https://images.pexels.com/photos/7706648/pexels-photo-7706648.jpeg?auto=compress&cs=tinysrgb&w=1200"})

  name = usernames[2].split(" ")
  User.create({email: "#{name.first.downcase}.#{name.last.downcase}@rent-or-die.com", name: usernames[2], password: password, city: Faker::Address.city, photo: "https://images.pexels.com/photos/1839564/pexels-photo-1839564.jpeg?auto=compress&cs=tinysrgb&w=1200"})

  name = usernames[3].split(" ")
  User.create({email: "#{name.first.downcase}.#{name.last.downcase}@rent-or-die.com", name: usernames[3], password: password, city: Faker::Address.city, photo: "https://images.pexels.com/photos/14426059/pexels-photo-14426059.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"})

  name = usernames[4].split(" ")
  User.create({email: "#{name.first.downcase}.#{name.last.downcase}@rent-or-die.com", name: usernames[4], password: password, city: Faker::Address.city, photo: "https://images.pexels.com/photos/5435433/pexels-photo-5435433.jpeg?auto=compress&cs=tinysrgb&w=1200"})

  name = usernames[5].split(" ")
  User.create({email: "#{name.first.downcase}.#{name.last.downcase}@rent-or-die.com", name: usernames[5], password: password, city: Faker::Address.city, photo: "https://images.pexels.com/photos/5448506/pexels-photo-5448506.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"})

  name = usernames[6].split(" ")
  User.create({email: "#{name.first.downcase}.#{name.last.downcase}@rent-or-die.com", name: usernames[6], password: password, city: Faker::Address.city, photo: "https://de.web.img3.acsta.net/r_1280_720/pictures/15/05/05/11/59/147661.jpg"})

  name = usernames[7].split(" ")
  User.create({email: "#{name.first.downcase}.#{name.last.downcase}@rent-or-die.com", name: usernames[7], password: password, city: Faker::Address.city, photo: "https://images.pexels.com/photos/5553892/pexels-photo-5553892.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"})

  name = usernames[8].split(" ")
  User.create({email: "#{name.first.downcase}.#{name.last.downcase}@rent-or-die.com", name: usernames[8], password: password, city: Faker::Address.city, photo: "https://images.unsplash.com/photo-1605595988901-3d06601c38ad?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1015&q=80"})


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
