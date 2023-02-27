class YogaStudio < ApplicationRecord
  # Associations
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings

  # Validations
  validates :name, presence: true
  validates :address, presence: true
  validates :price_per_hour, presence: true
  validates :size_in_m2, presence: true
  validates :description, presence: true
end
