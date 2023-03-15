class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :favourites
  has_one_attached :photo
  validates :title, presence: true
  validates :location, presence: true
  validates :description, length: { minimum: 20 }
  validates :average_rating, absence: true

end
