class AddLocationToDiscount < ActiveRecord::Migration[5.1]
  def change
    add_column :discounts, :location, :string
  end
end
