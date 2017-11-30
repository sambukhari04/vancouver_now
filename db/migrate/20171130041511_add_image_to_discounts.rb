class AddImageToDiscounts < ActiveRecord::Migration[5.1]
  def change
    add_column :discounts, :image, :string
  end
end
