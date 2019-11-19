class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :trips, dependent: :destroy

  validates :email, presence: true
<<<<<<< HEAD
  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :home_city, presence: true
=======
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :home_city, presence: true
>>>>>>> 1ca977c2db37db50b998159c7617b0c51a3214b3
end
