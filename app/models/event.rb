class Event < ApplicationRecord
  # assciation
  belongs_to :category
  belongs_to :user
  # image uploader
  mount_uploader :image, ImageUploader

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

    # where("description LIKE ?", "%#{search}%")
  end

  # def self.search(search)
  #   where("name LIKE ?", "%#{search}%")
  #   where("content LIKE ?", "%#{search}%")
  # end

end
