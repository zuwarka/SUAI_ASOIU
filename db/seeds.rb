# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

(1..5).each do |id|
  User.create!(
    id:,
    username: Faker::Name.name,
    email: Faker::Internet.email,
    password: "password"
  )
end

(1..30).each do |id|
  Company.create!(
    id:,
    name_company: Faker::Company.name
  )
end
company = Company.ids

(1..15).each do |id|
  Position.create!(
    id:,
    name_position: Faker::Company.profession
  )
end
position = Position.ids

(1..15).each do |id|
  ServiceType.create!(
    id:,
    name_service_type: Faker::Restaurant.type
  )
end
service_type = ServiceType.ids

(1..10).each do |id|
  TrainType.create!(
    id:,
    name_train_type: Faker::Coffee.blend_name
  )
end
train_type = TrainType.ids

(1..30).each do |id|
  Employee.create!(
    id:,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    name_station: Faker::Address.city,
    position_id: position.sample
  )
end
employee = Employee.ids

(1..50).each do |id|
  Passenger.create!(
    id:,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birth_date: Faker::Date.birthday(min_age: 18, max_age: 100),
    passport_id: Faker::SouthAfrica.id_number,
    citizenship: Faker::Address.country
  )
end
passenger = Passenger.ids

start_time = DateTime.civil(2000, 1, 1)
end_time = DateTime.civil(2023, 12, 31)

(1..30).each do |id|
  arrival = Faker::Time.between(from: start_time, to: end_time)
  departure = Faker::Time.between(from: arrival + 1.day, to: arrival + 5.day)

  Trip.create!(
    id:,
    number_trip: Faker::Number.unique.between(from: 1, to: 999),
    arrival_time: arrival.to_fs(:short),
    departure_time: departure.to_fs(:short),
    service_type_id: service_type.sample,
    train_type_id: train_type.sample,
    company_id: company.sample
  )
end
trip = Trip.ids

(1..50).each do |id|
  Ticket.create!(
    id:,
    passenger_id: passenger.sample,
    trip_id: trip.sample,
    employee_id: employee.sample
  )
end
