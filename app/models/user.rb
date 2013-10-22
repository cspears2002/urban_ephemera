class User
  include Mongoid::Document

  field	:name, type: String
  field :username, type: String
  field	:password, type: String
  field :number_reviews, type: Integer, default: 0

  # has_many :reviews, autosave: true
  has_many :reviews

end
