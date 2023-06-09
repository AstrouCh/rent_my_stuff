class Item < ApplicationRecord
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location? # what is this will_save_change_to_location?
  belongs_to :user
  belongs_to :category
  has_one_attached :photos
  has_many :bookings, dependent: :destroy
  has_many_attached :photos
  validates :price, presence: true
  validates :title, presence: true
  validates :location, presence: true
  validates :description, length: { minimum: 20 }
  validates :average_rating, absence: true

  include PgSearch::Model
  pg_search_scope :search_by_title_and_category_and_description,
    against: [ :title, :description ],
    associated_against: {
      category: [ :name ]
    },
    using: {
      tsearch: { prefix: true }
  }
end
