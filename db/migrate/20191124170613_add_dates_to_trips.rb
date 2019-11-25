class AddDatesToTrips < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :dates, :string
  end
end
