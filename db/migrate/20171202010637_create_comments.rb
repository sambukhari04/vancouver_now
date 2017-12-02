class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.references :event, foreign_key: true, index: true
      t.references :user, foreign_key: true, index: true
      t.text :body

      t.timestamps null: false
    end
  end
end
