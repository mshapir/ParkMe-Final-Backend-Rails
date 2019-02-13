class Review < ApplicationRecord
  validates_presence_of :comment
  belongs_to :user
  belongs_to :listing
end
