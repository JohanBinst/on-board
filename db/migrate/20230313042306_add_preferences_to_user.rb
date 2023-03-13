class AddPreferencesToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :preferences, :jsonb, default: nil
  end
end
