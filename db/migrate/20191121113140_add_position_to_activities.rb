class AddPositionToActivities < ActiveRecord::Migration[5.2]
  def change
    add_column :activities, :position, :integer
  end
end