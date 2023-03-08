class Trip < ApplicationRecord
  DEPARTURE = {
    'Orphelinat Bay': { lat: -22.288932, lng:  166.441671 },
    'Côte Blanche': { lat: -22.309739, lng: 166.458233 },
    'Port Plaisance': { lat: -22.290046, lng: 166.437332 },
    'Port du Sud': { lat: 22.284205, lng: 166.441732 },
    'Port Moselle': { lat: -22.278822, lng: 166.438138 },
    'Ouano': { lat: -21.842394, lng: 165.809028 },
    'Tomo': { lat: -21.959447, lng: 166.138428 }
  }


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
  # Not necessary to geocode the departure points, already have latitude and longitude
  # geocoded_by :departure_point
  # after_validation :geocode, if: :will_save_change_to_departure_point?
  include PgSearch::Model
  pg_search_scope :search_by_parameters,
    against: [ :activity_type, :destination ],
    using: {
      tsearch: { prefix: true }
    }

end
