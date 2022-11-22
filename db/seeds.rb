require 'faker'

puts "Clearing database..."
User.destroy_all
Survivalist.destroy_all
Metting.destroy_all

puts "Creating users..."
20.times do
  User.create({email: Faker::Internet.email, name: "", password: Faker::Internet.password, city: Faker::Address.city})
end
puts "Users created!"

users = User.all

puts "Creating survivalists..."
12.times do
  Survivalist.create({name: "", category: "", skills: "", street: Faker::Address.street_address, postcode: Faker::Address.zip_code, city: Faker::Address.city})
end
puts "Survivalists created!"

survivalists = Survivalist.all

# puts "Creating meetings..."
# Meeting.create({})
# puts "Meetings created!"

puts "Database seeded!"