class Step < ApplicationRecord
  belongs_to :trip
  has_many :activities, dependent: :destroy

  validates :nights, presence: true
  validates :location, presence: true
  validates :address, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
