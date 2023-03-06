class Trip < ApplicationRecord
  has_many :bookings
  belongs_to :user
  validates :name, :activity_type, :destination, :departure_point, :description, :features, presence: true
  validates :price, :seats, presence: true, comparison: { greater_than: 0 }
  # validates :departure_datetime, presence: true, timeliness: { after: -> { Time.now }, message: "must be after current time" }
end
