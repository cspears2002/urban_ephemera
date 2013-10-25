class Store
  include Mongoid::Document

  field :name, type: String
  field :specialty, type: String
  field :avg_rating, type: Float, default: 0
  field :number_reviews, type: Integer, default: 0
  field :street, type: String
  field :city, type: String
  field :state, type: String
  field :zip, type: Integer
  field :phone_number, type: Integer
  field :email, type: String
  field :website, type: String

  # has_many :reviews, autosave: true
  embeds_many :reviews

end