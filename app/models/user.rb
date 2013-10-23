require 'bcrypt'

class User
  include Mongoid::Document

  attr_accessor :password, :password_confirmation

  field :number_reviews, type: Integer, default: 0

  # for confirmation
  field :username, type: String
  field :salt, type: String
  field	:hashed_password, type: String

  # has_many :reviews, autosave: true
  has_many :reviews

  before_save :hash_password
  validates :username, presence: true
  validates :username, uniqueness: { case_sensitive: false }
  validates :password, confirmation: true

  def authenticate(password)
    self.hashed_password == 
    BCrypt::Engine.hash_secret(password, self.salt)
  end

  private

  def hash_password
  	if password.present?
  		self.salt = BCrypt::Engine.generate_salt
      self.hashed_password = BCrypt::Engine.hash_secret(password, self.salt)
      password = password_confirmation = nil
    end
  end

end
