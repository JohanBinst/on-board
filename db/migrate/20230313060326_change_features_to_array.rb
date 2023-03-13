class ChangeFeaturesToArray < ActiveRecord::Migration[7.0]
  def change
    remove_column :trips, :features
    add_column :trips, :features, :string, array: true, default: []
    remove_column :trips, :activity_type
    add_column :trips, :activity_type, :string, array: true, default: []
  end
end
