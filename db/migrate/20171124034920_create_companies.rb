class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :slogan
      t.string :discount

      t.timestamps
    end
  end
end
