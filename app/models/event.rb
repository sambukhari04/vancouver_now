class Event < ApplicationRecord
  belongs_to :category
  belongs_to :user

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
    validates(:start_time, {
        presence: true
    })
    validates(:end_time, {
        presence: true
    })

    def format_start
      start_time.strftime("%I:%M %p")
    end

    def format_end
      end_time.strftime("%I:%M %p")
    end
end
