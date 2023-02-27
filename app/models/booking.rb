class Booking < ApplicationRecord
  belongs_to :yoga_studio
  belongs_to :user
end
