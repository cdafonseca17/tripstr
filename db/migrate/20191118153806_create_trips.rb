class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :name
      t.string :start_date
      t.string :end_date
      t.string :country_code
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
