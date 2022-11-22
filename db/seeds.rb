require 'faker'

puts "Clearing database..."
Meeting.destroy_all
Survivalist.destroy_all
User.destroy_all


usernames = ["Bearclaw Mohawk", "Big Rebecca", "Captain Walker", "Crow Fishers", "Dr. Dealgood", "Feral Kid", "Immortan Joe", "Jim Goose", "Lord Humungus", "Mad Max", "May Swaisey", "Rictus Erectus", "Sprog Rockatansky", "The Toadie", "Toast the Knowing"]


puts "Creating users..."
usernames.each do |username|
  name = username.split(" ")
  User.create({email: "#{name.first.downcase}.#{name.last.downcase}@rent-or-die.com", name: username, password: Faker::Internet.password, city: Faker::Address.city})
end
puts "Users created!"


users = User.all
categories = ["Engineer", "Medical", "Destroyer", "Cook", "Hunter"]


puts "Creating survivalists..."
users.each_with_index do |user, index|
  if index < 3
    Survivalist.create({name: user.name, category: categories[0], skills: "", street: Faker::Address.street_address, postcode: Faker::Address.zip_code, city: user.city, photo: "https://images.pexels.com/photos/7706648/pexels-photo-7706648.jpeg?auto=compress&cs=tinysrgb&w=1200", user_id: user.id})
  elsif index >= 3 && index < 6
    Survivalist.create({name: user.name, category: categories[1], skills: "", street: Faker::Address.street_address, postcode: Faker::Address.zip_code, city: user.city, photo: "https://images.pexels.com/photos/5435433/pexels-photo-5435433.jpeg?auto=compress&cs=tinysrgb&w=1200", user_id: user.id})
  elsif index >= 6 && index < 9
    Survivalist.create({name: user.name, category: categories[2], skills: "", street: Faker::Address.street_address, postcode: Faker::Address.zip_code, city: user.city, photo: "https://images.pexels.com/photos/1839564/pexels-photo-1839564.jpeg?auto=compress&cs=tinysrgb&w=1200", user_id: user.id})
  elsif index >= 9 && index < 12
    Survivalist.create({name: user.name, category: categories[3], skills: "", street: Faker::Address.street_address, postcode: Faker::Address.zip_code, city: user.city, photo: "https://images.pexels.com/photos/3536235/pexels-photo-3536235.jpeg?auto=compress&cs=tinysrgb&w=1200", user_id: user.id})
  elsif index >= 12 && index < 15
    Survivalist.create({name: user.name, category: categories[4], skills: "", street: Faker::Address.street_address, postcode: Faker::Address.zip_code, city: user.city, photo: "https://images.pexels.com/photos/5427357/pexels-photo-5427357.jpeg?auto=compress&cs=tinysrgb&w=1200", user_id: user.id})
  end
end
puts "Survivalists created!"


survivalists = Survivalist.all


puts "Creating meetings..."
Meeting.create({start_date: Date.today, end_date: Date.today + 1, user_id: users[0].id, survivalist_id: survivalists[0].id})
puts "Meetings created!"


puts "Database seeded!"
