
class HuntsController < ApplicationController

  # GET /hunts
  def index
    @hunts = Hunt.all
    
  end

  # GET /hunts/1
  def show
    @hunt = Hunt.find(params[:id])
    @quiz = Quiz.new
    @quizzes = Quiz.all
  end

  # GET /hunts/new
  def new
 

    @hunt = Hunt.new
    @location = Location.find(params[:location_id])
   
  end

  # POST /hunts
  def create
    
    @location = Location.find(params[:location_id])

    @hunt = @location.hunts.build(hunt_params)
 
    @hunt.user = current_user

    if @hunt.save
      redirect_to hunt_path(@hunt), notice: 'Hunt was successfully created.'
    else
         binding.pry
      redirect_to new_location_hunt_path(@location), notice: 'Hunt was not created.'
    end
  end

  
  def destroy
    @hunt = Hunt.find(params[:id]).destroy
    redirect_to @hunt, notice: 'Hunt was successfully deleted'
  end  

  
  def edit
  
     @hunt = Hunt.find(params[:id])
    
  end

  def update
    binding.pry
    @location = Location.find(params[:location_id])
    #@hunt = Hunt.update(hunt_params)
    @hunt = @location.hunt.update(hunt_params)
    redirect_to @location, notice: 'Hunt was successfully updated'
  end 

 


  #private

  # Never trust parameters from the scary internet, only allow the white list through.
  def hunt_params
    params.require(:hunt).permit(:name, :category, :description, :user_id, :location_id)
  end
end
