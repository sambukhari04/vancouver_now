class CreateDiscounts < ActiveRecord::Migration[5.1]
  def change
    create_table :discounts do |t|
      t.string :name
      t.text :description
      t.string :discount
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
