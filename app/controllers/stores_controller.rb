class StoresController < ApplicationController
  
  def index
    @stores = Store.all
  end

  def show
  	@store = Store.find(params[:id])
  end

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(params[:store]
                              .permit(
                                :name,
                                :specialty,
                                :street,
                                :city,
                                :state,
                                :zip,
                                :phone_number,
                                :email,
                                :website
                                ))
    if Store.where(name: params[:store][:name]).exists?
      store = Store.find_by(name: params[:store][:name])
      redirect_to :action => 'show', :id => store._id
    else
      @store.save
      redirect_to :action => 'show', :id => @store._id      
    end
  end

end