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
#     User.create!(
#         first_name: Faker::Name.first_name,
#         last_name:  Faker::Name.last_name,
#         email: Faker::Name.first_name.concat(Faker::Number.decimal_part(digits: 2).concat("@yopmail.com")),
#         password: "valena",
#         description: Faker::TvShows::RickAndMorty.quote)
# end

# 30.times do
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
    2.times do
        Attendance.create(
            event_id: Event.all.sample.id,
            attendee_id: User.all.sample.id
        )
    end

end     