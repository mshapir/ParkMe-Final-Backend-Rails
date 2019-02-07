class ReservationSerializer < ActiveModel::Serializer
  attributes :id, :user, :listing
  belongs_to :user
  belongs_to :listing
end
