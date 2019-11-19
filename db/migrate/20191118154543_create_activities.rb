class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :category
      t.float :longitude
      t.float :latitude
      t.text :address
      t.text :comment
      t.text :description
      t.references :step, foreign_key: true

      t.timestamps
    end
  end
end
