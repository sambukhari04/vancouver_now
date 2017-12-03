class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.float :payment

      t.timestamps
    end
  end
end
