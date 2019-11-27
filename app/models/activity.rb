class Activity < ApplicationRecord
  belongs_to :step
  acts_as_list scope: :step
  # validates :name, presence: true

  # validates :description, length: { maximum: 500 }
  # validates :comment, length: { maximum: 500 }
  mount_uploader :photo, PhotoUploader
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  # reverse_geocoded_by :coordinates
end
