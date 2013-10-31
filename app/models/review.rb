class Review
  include Mongoid::Document

  field :rating, type: Float
  field :body, type: String

  belongs_to :user
  belongs_to :store

end
