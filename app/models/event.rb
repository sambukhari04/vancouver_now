class Event < ApplicationRecord
  # assciation
  belongs_to :category
  belongs_to :user
  # image uploader
  mount_uploader :image, ImageUploader

  # geolocation
  geocoded_by :full_street_address   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates

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

  def self.search(search)
    where("title ILIKE ? OR description ILIKE ?", "%#{search}%", "%#{search}%")
  end

  def full_street_address
    "#{street}#{city}#{province}#{postal}"
  end


end
