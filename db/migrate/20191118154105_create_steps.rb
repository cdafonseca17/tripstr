class CreateSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :steps do |t|
      t.integer :nights
      t.string :location
      t.float :longitude
      t.float :latitude
      t.text :address
      t.references :trip, foreign_key: true

      t.timestamps
    end
  end
end
