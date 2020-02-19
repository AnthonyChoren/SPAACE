class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   has_many :flats, dependent: :destroy
   has_many :bookings, dependent: :destroy

    validates :email, confirmation: true, presence: true
    validates :first_name, presence: true, length: { minimum: 4 }
    validates :last_name, presence: true, length: { minimum: 4 }
    validates :phone_number, presence: true, numericality: { only_integer: true }
    # validates :rating, presence: true
end
