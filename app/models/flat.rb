class Flat < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, presence: true, length: { minimum: 3 }
  validates :planet, presence: true, inclusion: { in: %w(mars mercury venus earth mars jupiter saturn uranus neptune),
    message: "%{value} is not a valid planet" }
  validates :capacity, presence: true, numericality: { only_integer: true }
  validates :description, presence: true, length: { minimum: 10 }
end
