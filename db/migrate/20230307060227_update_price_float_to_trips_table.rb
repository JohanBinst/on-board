class UpdatePriceFloatToTripsTable < ActiveRecord::Migration[7.0]
  def change
    change_column :trips, :price, :float
  end
end
