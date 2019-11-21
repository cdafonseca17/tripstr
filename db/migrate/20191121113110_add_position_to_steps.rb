class AddPositionToSteps < ActiveRecord::Migration[5.2]
  def change
    add_column :steps, :position, :integer
  end
end
