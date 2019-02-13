class Listing < ApplicationRecord
  validates_presence_of :title, :image, :description, :location
  belongs_to :user
  has_many :reservations
  has_many :users, through: :reservations
  has_many :reviews
end
