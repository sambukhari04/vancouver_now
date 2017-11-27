class AddUsersToDiscount < ActiveRecord::Migration[5.1]
  def change
    add_reference :discounts, :user, foreign_key: true, default: false
  end
end
