class ParkMeUser < User
  has_secure_password
  validates :password, length: { in: 6..20 }
  validates_confirmation_of :password, allow_nil: true, allow_blank: false

  def initialize(type = 'ParkMeUser')
    print type
    super
    @type = type
  end
end
