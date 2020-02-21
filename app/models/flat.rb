class Flat < ApplicationRecord
  belongs_to :user
  belongs_to :planet
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  validates :name, presence: true, length: { minimum: 3 }
  # validates :planet, presence: true, inclusion: { in: %w(Mars Mercury Moon Venus Earth Jupiter Saturn Uranus Neptune),
  #   message: "%{value} is not a valid planet" }
  validates :capacity, presence: true, numericality: { only_integer: true }
  validates :description, presence: true, length: { minimum: 3 }
  validates :photo, presence: true
end
