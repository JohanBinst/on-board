class AddTimeToTripsTable < ActiveRecord::Migration[7.0]
  def change
    add_column :trips, :start_time, :time
  end
end
