class Category < ApplicationRecord
  has_many :event, dependent: :destroy

  validates :name, {
    presence: true,
  }

end
