require 'bcrypt'

class User
  include Mongoid::Document

  attr_accessor :password, :password_confirmation

  field	:name, type: String
  field :username, type: String
  field :number_reviews, type: Integer, default: 0

  # for confirmation
  field :salt, type: String
  field	:hashed_password, type: String

  # has_many :reviews, autosave: true
  has_many :reviews

end
