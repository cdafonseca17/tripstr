class AddIconToActivities < ActiveRecord::Migration[5.2]
  def change
    add_column :activities, :icon, :string
  end
end
