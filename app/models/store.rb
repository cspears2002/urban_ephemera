class Store
  include Mongoid::Document

  field :name, type: String
  field :speciality, type: String
  field :avg_rating, type: Float
  field :number_reviews, type: Integer
  field :street, type String
  field :city, type String
  field :state, type String
  field :zip, type Integer
  field :phone_number, type Integer
  field :email, type String
  field :website, type String

  # has_many :reviews, autosave: true
  has_many :reviews

end