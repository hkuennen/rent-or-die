require 'faker'
require 'date'

puts "Clearing database..."
Meeting.destroy_all
Survivalist.destroy_all
# Removing cloudinary images
usr = User.all
usr.each do |u|
  u.photo.purge
end
User.destroy_all


usernames = ["Bearclaw Mohawk", "Big Rebecca", "Captain Walker", "Crow Fishers", "Doctor Dealgood", "Feral Kid", "Mad Max", "May Swaisey", "Jim Goose"]

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
a = Survivalist.create({name: users[0].name, category: categories[2], skills: "Killing", address: Faker::Address.full_address, street: "1 Paetschstraße", postcode: "12307", city: users[0].city, photo: users[0].photo, user_id: users[0].id})

a.address = "#{a.street}, #{a.postcode} #{a.city}"
a.save

b = Survivalist.create({name: users[1].name, category: categories[4], skills: "Finding food", address: Faker::Address.full_address, street: "14A Schrockstraße", postcode: "14165", city: users[1].city, photo: users[1].photo, user_id: users[1].id})

b.address = "#{b.street}, #{b.postcode} #{b.city}"
b.save

c = Survivalist.create({name: users[2].name, category: categories[3], skills: "Reduce hunger", address: Faker::Address.full_address, street: "16A Altenescher Weg", postcode: "10407", city: users[2].city, photo: users[2].photo, user_id: users[2].id})

c.address = "#{c.street}, #{c.postcode} #{c.city}"
c.save

d = Survivalist.create({name: users[3].name, category: categories[3], skills: "Producing food", address: Faker::Address.full_address, street: "60 Anklamer Straße", postcode: "10115", city: users[3].city, photo: users[3].photo, user_id: users[3].id})

d.address = "#{d.street}, #{d.postcode} #{d.city}"
d.save

e = Survivalist.create({name: users[4].name, category: categories[1], skills: "Fast patching", address: Faker::Address.full_address, street: "8 Waldsteg", postcode: "13158", city: users[4].city, photo: users[4].photo, user_id: users[4].id})

e.address = "#{e.street}, #{e.postcode} #{e.city}"
e.save

f = Survivalist.create({name: users[5].name, category: categories[4], skills: "Headshots", address: Faker::Address.full_address, street: "95 Waldschulallee", postcode: "14055", city: users[5].city, photo: users[5].photo, user_id: users[5].id})

f.address = "#{f.street}, #{f.postcode} #{f.city}"
f.save

g = Survivalist.create({name: users[6].name, category: categories[0], skills: "Build shelter", address: Faker::Address.full_address, street: "116 Riemeisterstraße", postcode: "14169", city: users[6].city, photo: users[6].photo, user_id: users[6].id})

g.address = "#{g.street}, #{g.postcode} #{g.city}"
g.save

h = Survivalist.create({name: users[7].name, category: categories[3], skills: "Cooking", address: Faker::Address.full_address, street: "3 Wilmsstraße", postcode: "10961", city: users[7].city, photo: users[7].photo, user_id: users[7].id})

h.address = "#{h.street}, #{h.postcode} #{h.city}"
h.save

i = Survivalist.create({name: users[8].name, category: categories[1], skills: "Treat injuries", address: Faker::Address.full_address, street: "84 Niederneuendorfer Allee", postcode: "13587", city: users[8].city, photo: users[8].photo, user_id: users[8].id})

i.address = "#{i.street}, #{i.postcode} #{i.city}"
i.save
puts "Survivalists created!"

survivalists = Survivalist.all

puts "Creating meetings..."
Meeting.create({ start_date: DateTime.now, end_date: DateTime.now + 1, user_id: users[0].id, survivalist_id: survivalists[0].id })
puts "Meetings created!"

puts "Database seeded!"

