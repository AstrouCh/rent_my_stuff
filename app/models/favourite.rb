class Favourite < ApplicationRecord
  belongs_to :item
  belongs_to :user
  validates :title, presence: true
  validates :title, uniqueness: true
end
