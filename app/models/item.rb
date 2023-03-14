class Item < ApplicationRecord
  belongs_to :user
  has_one :categories

  validates :title, presence: true
  validates :location, presence: true
  validates :description, length: { minimum: 20 }
  validates :average_rating, absence: true

end
