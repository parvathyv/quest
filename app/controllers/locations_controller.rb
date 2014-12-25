class LocationsController < ApplicationController

  before_filter :user_signed_in?, :only => [:edit, :update, :destroy]

  # GET /questions
  def index
    @locations = Location.order(id: :DESC)
  end

  # GET /questions/1
  def show
 
    @location = Location.find(params[:id])

    
    #@hunt= Hunt.new
    
    
    @hunts = @location.hunts
   
    binding.pry
   
  end

  # GET /questions/new
  def new
    @location = Location.new
    #@hunt= Hunt.new
  end

  # POST /questions
  def create
   
   
    @location= Location.new(location_params)
  
   # @location.user = current_user
    
    if @location.save
      redirect_to @location, notice: 'Location was successfully created.'
    else
      render action: 'new'
    end
  end
  

  def destroy

    @location = Location.find(params[:id]).destroy
    redirect_to @location, notice: 'Location was successfully deleted'
  end  
 

  def edit
  
     @location = Location.find(params[:id])
    
  end

  def update
    @location = Location.find(params[:id])

    
    @location.update(question_params)

  
    if @location.save
      redirect_to @location, notice: 'Location was successfully created.'
    else
      render action: 'edit'
    end
  end  
  
  
  # GET /questions/search
  def search
    query = "%#{params[:query]}%"
    @questions = Location.where('title like ? or description like ? or url like ?',
             query, query, query)
  end
  
  
  #private

  # Never trust parameters from the scary internet, only allow the white list through.
  def location_params
    params.require(:location).permit(:latitude, :longitude, :address)
  end

  
end
