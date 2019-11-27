class AddPhotoGoogleToActivities < ActiveRecord::Migration[5.2]
  def change
    add_column :activities, :photo_google, :string
  end
end
