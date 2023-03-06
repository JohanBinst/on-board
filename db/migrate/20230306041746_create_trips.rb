class CreateTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :trips do |t|
      t.string :name
      t.string :activity_type
      t.string :destination
      t.string :departure_point
      t.datetime :departure_date_time
      t.integer :price
      t.integer :seats
      t.string :features
      t.text :description

      t.timestamps
    end
  end
end
