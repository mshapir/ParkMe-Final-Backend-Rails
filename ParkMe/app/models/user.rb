class User < ApplicationRecord
  has_secure_password
   validates :password, length: { in: 6..20 }
  validates_confirmation_of :password, allow_nil: true, allow_blank: false

  validates_presence_of :name
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :username, uniqueness: { case_sensative: false }


  has_many :reservations
  has_many :listings, through: :reservations
end
