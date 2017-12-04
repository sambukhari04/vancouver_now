class Company < ApplicationRecord
  has_many :discount, dependent: :destroy
  has_many :user, dependent: :destroy

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
