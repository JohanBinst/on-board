class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :trip
  has_many :messages, dependent: :destroy

  validates :total_guests, :total_price, presence: true, comparison: { greater_than: 0 }
end
