class UsersController < ApplicationController
  
  def index
    @users = User.all
  end

  def show
  	@user = User.find(params[:id])
  end

  def new
  	@user = User.new(username: params[:username])
  end

  def create
  	@user = User.create(params[:user]
                .permit(:username, :password, :password_confirmation))
  	redirect_to authentications_new_url(username: params[:user][:username])
  end

end
