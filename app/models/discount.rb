class Discount < ApplicationRecord
  belongs_to :company


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
