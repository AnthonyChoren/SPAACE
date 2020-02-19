class Booking < ApplicationRecord
  belongs_to :flat
  belongs_to :user

  validates :start_time,
  presence: true,
  date: { after: Proc.new { Date.today }, before: :end_time, message: 'must be after today' },
  on: :create

  validates :end_time,
  presence: true,
  date: { after: :start_time, message: 'must be after your start date' }
end
