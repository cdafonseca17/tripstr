class Trip < ApplicationRecord
  belongs_to :user
  has_many :steps, dependent: :destroy

  validates :name, presence: true, length: { maximum: 100 }
  validates :start_date, presence: true
  validates :end_date, presence: true
<<<<<<< HEAD

  geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?
=======
>>>>>>> b05f3e6e870456cfa412c2e22c2c0333d47ccdec
end
