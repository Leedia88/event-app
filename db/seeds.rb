# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'devise'

# 10.times do
#     first_name = Faker::Name.first_name  
#     last_name = Faker::Name.last_name
#     email = first_name + last_name + "@yopmail.com"
#     User.create!(first_name: first_name, last_name: last_name, email: email, encrypted_password: "valena")
# end

# 5.times do
#     Event.create!(
#         start_date: Faker::Date.between(from: Date.today, to: 1.year.from_now),
#         duration: rand(5..60)*5,
#         title: Faker::Science.science,
#         description: Faker::TvShows::Buffy.quote,
#         price: rand(1..500),
#         location: Faker::Address.street_address,
#         admin: User.all.sample
#     )
# end

Event.all.each do
    

5.times do
    Attendance.create!(
        stripe_customer_id: User.all.sample.id
    )
end

end     