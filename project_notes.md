1. CRUD

rails new Vancouver now!

//install the gems

gem 'faker', github: 'stympy/faker'
gem 'cowsay', '~> 0.3.0'
gem 'cancancan', '~> 2.0'
gem 'bootstrap', '~> 4.0.0.beta'
gem 'jquery-rails'
gem "font-awesome-rails"

bundle

//set the root for home page

make the home controller
def index
end

// go to routes

root 'home#index'

// make the category model

rails g model category name:string

rails db:create
rails db:migrate

//Git commit


//make events model
 rails g model event title:string description:text price:float location:string make_date:date


//events controller

rails g controller events --no-helper --no-assets --no-routes

-> event.rb

add validations

validates(:title, {
      presence: {message: 'must be provided'},
      uniqueness: true
  })
  validates(:description, {
      presence: {message: 'must be provided'},
      length: {minimum: 10, maximum: 10000}
  })
  validates(:price, numericality: {
      greater_than: 0
  })
  validates(:location, presence: true)
  validates(:make_date, presence: true)

























<!-- History  -->
