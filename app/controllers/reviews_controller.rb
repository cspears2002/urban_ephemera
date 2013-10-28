class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
  	@review = Review.new
  end

  def create
    @review = Review.create(params[:review].permit(:rating, :body, :user, :store))

  	redirect_to :action => "show", :id => @review._id
  end

end
