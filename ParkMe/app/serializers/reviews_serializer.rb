class ReviewsSerializer < ActiveModel::Serializer
  attributes :id, :rating, :comment
  belongs_to :user
  belongs_to :listing
end
