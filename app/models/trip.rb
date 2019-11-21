class Trip < ApplicationRecord
  belongs_to :user
  has_many :steps, -> { order(position: :asc) }, dependent: :destroy
  has_many :activities, through: :steps

  validates :name, presence: true, length: { maximum: 100 }
  validates :start_date, presence: true
  validates :end_date, presence: true

  # after_validation :geocode, if: :will_save_change_to_address?
  # geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?
end
