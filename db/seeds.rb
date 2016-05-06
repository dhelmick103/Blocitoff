require 'faker'

#CreateUsers
15.times do
  user = User.new(
    email:      Faker::Internet.email,
    password:   Faker::Lorem.characters(8)
    )
    user.skip_confirmation!
    user.save!
end

users = User.all

#CreateItems

60.times do
  Item.create!(
    name: Faker::Lorem.sentence,
    user: users.sample,
  )
end

items = Item.all

puts "Seed complete"
puts "#{User.count} users created"
puts "#{Item.count} items created"
