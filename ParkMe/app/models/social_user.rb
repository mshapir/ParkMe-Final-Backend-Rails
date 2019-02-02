class SocialUser < User
  def initialize(type = 'SocialUser')
    super
    @type = type
  end
end
