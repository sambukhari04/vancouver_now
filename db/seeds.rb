# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
PASSWORD = '123abc'
Event.destroy_all
Category.destroy_all
Comment.destroy_all
User.destroy_all
Discount.destroy_all

# categories = [
#   'IT',
#   'Business',
#   'Arts',
#   'Music',
#   'Fashion',
#   'Sports',
#   'Tech',
#   'Family',
#   'Health & Wellness',
#   'Learning',
#   'Dance',
#   'Food & Drink',
# ]





super_user = User.create(
  first_name: 'Samuel',
  last_name: 'Book',
  email: 'sam@mail.ru',
  password: PASSWORD,
  is_admin: true
)


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
    category: categories.sample,
    start_time: Faker::Time.between(2.days.ago, Date.today, :morning),
    end_time: Faker::Time.between(2.days.ago, Date.today, :evening)
  )
end
events = Event.all

5.times.each do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  User.create(
      first_name: first_name,
      last_name: last_name,
      email: "#{first_name.downcase}.#{last_name.downcase}@example.com",
      password: PASSWORD
  )
end
users = User.all



puts Cowsay.say("Created #{events.count} events", :dragon)
puts Cowsay.say("Created #{categories.count} categories", :dragon)
puts Cowsay.say("Created #{users.count} users", :tux)
puts "Login as admin user with #{super_user.email} and password of '#{PASSWORD}'!"
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
