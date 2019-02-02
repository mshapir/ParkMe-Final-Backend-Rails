class User < ApplicationRecord
  validates_presence_of :name
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :username, uniqueness: { case_sensative: false }

  before_save :downcase_name
  before_save :downcase_username


  has_many :reservations
  has_many :listings, through: :reservations

  def downcase_name
    self.name = self.name.delete(' ').downcase
  end

  def downcase_username
    self.username = self.username.delete(' ').downcase
  end

end
