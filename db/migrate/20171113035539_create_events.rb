class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.float :price
      t.string :location
      t.date :make_date

      t.timestamps
    end
  end
end
