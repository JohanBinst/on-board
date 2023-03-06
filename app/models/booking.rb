class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :trip

  validates :total_guests, total_price, presence: true, availability: true, comparison: { greater_than: 0 }
end
