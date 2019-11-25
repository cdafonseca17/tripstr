class Trip < ApplicationRecord
  belongs_to :user
  has_many :steps, -> { order(position: :asc) }, dependent: :destroy
  has_many :activities, through: :steps

  validates :name, presence: true, length: { maximum: 100 }
  validates :start_date, presence: true
  validates :end_date, presence: true

  def country_name
    country = ISO3166::Country[country_code]
    country.translations[I18n.locale.to_s] || country.name
  end

  geocoded_by :country
  after_validation :geocode

  # after_validation :geocode, if: :will_save_change_to_address?
end
