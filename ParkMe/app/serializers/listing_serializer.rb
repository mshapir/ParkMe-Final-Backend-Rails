class ListingSerializer < ActiveModel::Serializer
  attributes :id, :title, :image, :description, :location, :price
  belongs_to :user
  has_many :reservations
  has_many :users, through: :reservations
end
