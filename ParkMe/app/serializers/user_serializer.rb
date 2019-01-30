class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username
  has_many :reservations
  has_many :listings, through: :reservations
end
