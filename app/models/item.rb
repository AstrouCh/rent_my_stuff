class Item < ApplicationRecord
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location? # what is this will_save_change_to_location?
  belongs_to :user
  belongs_to :category
  has_many :favourites

  validates :title, presence: true
  validates :location, presence: true
  validates :description, length: { minimum: 20 }
  validates :average_rating, absence: true

end
