class Review
  include Mongoid::Document

  field :rating, type: Float
  field :body, type: String

  belongs_to :user
  embedded_in :store
  
end
