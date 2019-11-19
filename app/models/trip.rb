class Trip < ApplicationRecord
  belongs_to :user
  has_many :steps, dependent: :destroy

  validates :name, presence: true, length: { maximum: 100 }
  validates :start_date, presence: true
  validates :end_date, presence: true

  geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?

end
