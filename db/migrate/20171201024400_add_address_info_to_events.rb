class AddAddressInfoToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :street, :string
    add_column :events, :city, :string
    add_column :events, :province, :string
    add_column :events, :postal, :string
    add_column :events, :longitude, :float
    add_column :events, :latitude, :float
  end
end
