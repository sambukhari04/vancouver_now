class ChangeColumnEventTime < ActiveRecord::Migration[5.1]
  def change
    change_column :events, :start_time, :time
    change_column :events, :end_time, :time
  end
end
