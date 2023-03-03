class YogaStudio < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_name_and_description, against: [
    [:name, 'A'],
    [:description, 'B']
  ], using: { tsearch: { prefix: true } }

  # Associations
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  has_many :reviews, dependent: :destroy
  has_many_attached :photos

  # Validations
  validates :name, presence: true
  validates :address, presence: true
  validates :price_per_hour, presence: true
  validates :size_in_m2, presence: true
  validates :description, presence: true
  validates :photos, presence: true

  # map
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
