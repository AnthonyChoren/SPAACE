class Flat < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :name, presence: true, length: { minimum: 3 }
  validates :planet, presence: true, inclusion: { in: %w(Mars Mercury Venus Earth Jupiter Saturn Uranus Neptune),
    message: "%{value} is not a valid planet" }
  validates :capacity, presence: true, numericality: { only_integer: true }
  validates :description, presence: true, length: { minimum: 10 }
end
