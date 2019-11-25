class AddLongitudeToTrips < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :longitude, :float
  end
end
