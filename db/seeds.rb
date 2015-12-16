# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do
  User.create!(
  email: Faker::Internet.safe_email,
  password: "helloworld"
  )
end
users = User.all

50.times do
  Item.create!(
  user: users.sample,
  name: Faker::Lorem.word
  )
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Item.count} items created"
