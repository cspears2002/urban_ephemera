class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
  	@review = Review.new
    @store = Store.find(params[:store_id])
  end

  def create

    @review = Review.new(params[:review].permit(:rating, :body))
    @review.user = current_user
    @review.store = Store.find(params[:store_id])
    @review.save

    # Set the number of reviews a user has
    current_user.update(number_reviews: current_user.reviews.count)

    # Update fields in store
    store = Store.find(params[:store_id])
    store.update(number_reviews: store.reviews.count)
    
   	redirect_to :action => "show", :id => @review._id
  end

end
