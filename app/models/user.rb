class User < ActiveRecord::Base
  attr_accessible :username, :password, :first_name, :last_name, :active, :instructor

  attr_accessor :password
  before_save :encrypt_password

  validates_presence_of :username
  validates_confirmation_of :password, :message => "Password cannot be blank"
  validates_presence_of :password, :on => :create, :message => " does not match."
  validates_uniqueness_of :username, :message => " That email address is taken."
  
  validates_length_of :password, :minimum => 8, :message => "Your password must be at least 8 characters in length."
  
  validates_format_of :username,
  	:with => /@/,
  	:message => "Needs to contain an @."

  validates_format_of :username,
  	:with => /\.[^\.]+$/,
  	:message => "Has to end with .com, .org, .net, etc."

  validates_format_of :username,
  	:with => /^.+@/,
  	:message => "Must have a username before the @"

  	validates_format_of :username,
  		:with => /^[^@]+@[^@]+$/,
  		:message => "Must be of the format 'something@something.xxx'"
  
  def self.authenticate(email, password)
    user = find_by_username(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

end
