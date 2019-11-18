class Step < ApplicationRecord
  belongs_to :trip
  has_many :activities

  validates :nights, presence: true
  validates :location, presence: true
  validates :address, presence: true
end
