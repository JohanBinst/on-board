class Trip < ApplicationRecord
  DEPARTURE = [
    "Orphelinat Bay",
    "Aquarêve",
    "Port Plaisance",
    "Port du Sud",
    "Port Moselle",
    "Ouano",
    "Tomo"
  ]

  DESTINATION = [
    "Dumbea pass",
    "Ilot Tenia",
    "False pass",
    "Amédée lighthouse",
    "Outer reef",
    "Ilot Signal",
    "Ilot Maitre",
    "Ilot Goeland"
  ]

  ACTIVITIES = [
    "Snorkeling",
    "Kayaking",
    "Paddleboarding",
    "Surfing",
    "Kiteboarding",
    "Windsurfing",
    "Diving",
    "Wingfoiling",
    "Wakeboaring",
    "Fishing",
    "Sailing",
    "Spearfishing",
    "Flyfishing"
  ]

  FEATURES_LIST = [
    "fishing gears",
    "first aids",
    "snorkel",
    "meals",
    "drinks",
    "speaker",
    "insurance",
    "sunsreen",
    "towels"
  ]

  has_many :bookings, dependent: :destroy
  belongs_to :user
  validates :name, :activity_type, :destination, :departure_point, :departure_date_time, :description, :features, presence: true
  validates :price, :seats, presence: true, comparison: { greater_than: 0 }
  # validates :departure_datetime, presence: true, timeliness: { after: -> { Time.now }, message: "must be after current time" }
  has_many_attached :photos
  has_one_attached :thumbnail

  include PgSearch::Model
  pg_search_scope :search_by_parameters,
    against: [ :activity_type, :destination ],
    using: {
      tsearch: { prefix: true }
    }
end
