class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :description, length: { minimum: 20 }, allow_blank: true
  validates :phone_number, phone: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
