class Discount < ApplicationRecord
  # belongs_to :company
  # association
  belongs_to :user
  #
  mount_uploader :image, ImageUploader

  validates(:name, {
      presence: true
  })
  validates(:description, {
      presence: true
  })
  validates(:discount, {
      presence: true
  })
  validates(:start_date, {
      presence: true
  })
  validates(:end_date, {
      presence: true
  })
  validates(:location, {
      presence: true
  })


end
