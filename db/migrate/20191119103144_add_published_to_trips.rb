class AddPublishedToTrips < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :published, :boolean, default: false
  end
end
