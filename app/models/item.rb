class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :favourites

  validates :title, presence: true
  validates :location, presence: true
  validates :description, length: { minimum: 20 }
  validates :average_rating, absence: true

end
