class ListingSerializer < ActiveModel::Serializer
  attributes :id, :title, :image, :description, :location, :price
  has_many :reservations
  has_many :users, through: :reservations
end
