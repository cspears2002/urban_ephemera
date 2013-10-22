class UsersController < ApplicationController
  
  def index
    @users = User.all
  end

  def show
  	@user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.create(params[:user].permit(:name, :username, :password))
  	redirect_to :action => "show", :id => @user._id
  end

end
