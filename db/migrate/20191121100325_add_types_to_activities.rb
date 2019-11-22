class AddTypesToActivities < ActiveRecord::Migration[5.2]
  def change
    add_column :activities, :types, :string
  end
end
