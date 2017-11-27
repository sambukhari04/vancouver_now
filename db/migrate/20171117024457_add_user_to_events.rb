class AddUserToEvents < ActiveRecord::Migration[5.1]
  def change
    add_reference :events, :user, foreign_key: true, default: false
  end
end
