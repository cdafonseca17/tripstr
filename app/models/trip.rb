class Trip < ApplicationRecord
  belongs_to :user
  has_many :steps

  validates :name, presence: true, length: { maximum: 100 }
  validates :start_date, presence: true
  validates :end_date, presence: true

end
