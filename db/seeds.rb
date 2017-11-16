# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Event.destroy_all
Category.destroy_all

15.times do
  Category.create(
    name: Faker::Pokemon.name
  )
end
categories = Category.all

50.times.each do
  Event.create(
    title: Faker::Friends.quote,
    description: Faker::TheFreshPrinceOfBelAir.quote,
    price: Faker::Commerce.price,
    make_date: Faker::Date.forward(23),
    location: Faker::Friends.location,
    category: categories.sample
  )
end

events = Event.all


puts Cowsay.say("Created #{events.count} events", :dragon)
puts Cowsay.say("Created #{categories.count} categories", :dragon)
