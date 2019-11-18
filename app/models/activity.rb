class Activity < ApplicationRecord
  belongs_to :step

  validates :category, presence: true
  validates :name, presence: true
  validates :address, presence: true
  validates :description, length: { maximum: 500 }
  validates :comment, length: { maximum: 500 }
end
