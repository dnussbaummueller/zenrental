class Booking < ApplicationRecord
  belongs_to :yoga_studio
  belongs_to :user

  validates :booking_status, presence: true, inclusion: { in: %w[pending accepted rejected] }
  validates :checkin_date, presence: true
  validates :checkout_date, presence: true
  validates :yoga_studio, presence: true
  validates :user, presence: true

  def pending?
    status == "pending"
  end
end
