class Event < ApplicationRecord
  belongs_to :category

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
    validates(:location, {
        presence: true
    })
    validates(:make_date, {
        presence: true
    })
end
