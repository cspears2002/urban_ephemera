class AuthenticationsController < ApplicationController
	before_action :authenticate_user, only: [:destroy]

  def new
    # Are they already logged in?
    if current_user
      redirect_to users_url
    else
      @user = User.new
      render :new
    end
  end

 def create
    user = User.find_by(username: params[:username][:password])
    if user
        # authenticate user
        if user.authenticate(params[:username][:password])
          session[:user_id] = user.id
          redirect_to users_url
        else
          flash.now.alert = "Unable to sign you in. Please try again."
          render :new
        end
    end
  end

end