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

//commit that shit
