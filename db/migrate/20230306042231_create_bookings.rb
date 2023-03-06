class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.integer :total_guests
      t.integer :total_price
      t.references :user, null: false, foreign_key: true
      t.references :trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
