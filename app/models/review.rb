class Review < ApplicationRecord
  belongs_to :booking
  validates :booking, uniqueness: { scope: :booking_id }
  validates :content, length: { minimum: 20, maximum: 100 }
  validates :rating, numericality: { only_integer: true }
  validates :rating, comparison: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
end
