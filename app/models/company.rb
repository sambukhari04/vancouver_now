class Company < ApplicationRecord
  has_many :discount
  has_many :user

    validates(:name, {
        presence: true
    })
    validates(:slogan, {
        presence: true
    })
    validates(:discount, {
        presence: true
    })


end
