class User < ActiveRecord::Base
  # attr_accessor :password, :password_confirmation
  has_secure_password
  attr_accessible :name, :email, :password, :password_confirmation
  

  before_save {|user| user.email = user.email.downcase}
  before_save :create_remember_token
  
  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # email is used as user name, should be uniqueness, name may be the same
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX},uniqueness: {case_sensitive:false}
  validates :password, presence: true, length: {minimum: 6} if new 
  validates :password_confirmation, presence: true

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end

end
