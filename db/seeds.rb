# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Rake::Task['db:reset'].invoke

100.times do
  User.create!(username: Faker::Company.buzzword)
end

200.times do
  Contact.create!(name: Faker::Name.name, email: Faker::Internet.email, user_id: rand(1..100))
end

  150.times do
    ContactShare.create(contact_id: rand(1..200), user_id: rand(1..100))
  end
