class AddUserToTrips < ActiveRecord::Migration[7.0]
  def change
    add_reference :trips, :user, index: true
  end
end
