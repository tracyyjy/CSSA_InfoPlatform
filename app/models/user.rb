class User < ActiveRecord::Base
  attr_accessor :password, :password_confirmation
  attr_accessible :name, :email, :password, :password_confirmation


  before_save {|user| user.email = user.email.downcase}

  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX},uniqueness: {case_sensitive:false}
  validates :password, presence: true
  validates :password_confirmation, presence: true


end
