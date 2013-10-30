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
    if @review.save

      # Set the number of reviews a user has
      current_user.update(number_reviews: current_user.reviews.count)

      # Update number_reviews field in store
      store = Store.find(params[:store_id])
      store.update(number_reviews: store.reviews.count)

      # Get the average rating for a store
      review_array = store.reviews.to_a
      rating_sum = 0
      review_array.each do |review| 
        rating_sum = rating_sum + review.rating
      end
      store.update(avg_rating: rating_sum/store.reviews.count)

   	  redirect_to :action => "show", :id => @review._id
    else

      # redirect to the edit route
      @review = Review.find_by(user: current_user)
      redirect_to :action => "edit", :id => @review._id
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    # Grab user's review
    @review = Review.find(params[:id])

    # Try to update review
    if @review.update_attributes(params[:review].permit(:rating, :body))
      
      # Update the average rating for a store
      store = Store.find(params[:store_id])
      review_array = store.reviews.to_a
      rating_sum = 0
      review_array.each do |review|
        rating_sum = rating_sum + review.rating
      end
      store.update(avg_rating: rating_sum/store.reviews.count)
    
      redirect_to :action => "show", :id => @review._id
    else
      render 'edit'
    end
  end

end
