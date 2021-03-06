class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :photo, PhotoUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :trips, dependent: :destroy

  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :home_city, presence: true

  validates :email, presence: true
  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :home_city, presence: true
  validates :username, uniqueness: true

  def to_param
   username
  end
end
