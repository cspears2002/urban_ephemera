class Review
  include Mongoid::Document

  field :rating, type: Float
  field :body, type: String

  belongs_to :user
  belongs_to :store
  
  def self.is_unique
  	where(user_id: user_id, store_id: store_id).exists?
  end

end
