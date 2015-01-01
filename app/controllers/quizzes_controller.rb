require 'open-uri'
class QuizzesController < ApplicationController
  before_filter :user_signed_in?, :only => [:edit, :update, :destroy]
  # GET /quizzes
  def index
    @lat = params[:lat]
   
    @location_zoom = 10

   
  end

  

  # GET /quizzes/1
  def show
    @hunt = Hunt.find(params[:hunt_id])
    @quiz = Quiz.find(params[:id])
    
    @flm = 0
    if params[:address] != nil
      if params[:address][:address] == @quiz.address
       @flm = 1
      else
      @flm = 0
      end  
    end   
    
  
  end

  

  

  # GET /quizzes/ne
  def new
   
    @quiz = Quiz.new
    @hunt = Hunt.find(params[:hunt_id])
   
  end

  # POST /quizzes
  def create

   
    @hunt = Hunt.find(params[:hunt_id])
    
    @quiz = @hunt.quizzes.build(quiz_params)
    @last_quiz = Quiz.where("hunt_id=?", @hunt.id)
      
    if @last_quiz == nil || @last_quiz.empty?
      @quiz.question_no = 1
    else  
      @quiz.question_no = @last_quiz.last.question_no + 1
    end  
  
    if @quiz.save
      
      if @quiz.question_no < 5
        redirect_to new_hunt_quiz_path(@hunt), notice: 'Quiz was successfully created.'
      else
        redirect_to hunt_path(@hunt), notice: 'Quiz was successfully created.' 
      end   
    else
        redirect_to hunt_path(@hunt), notice: 'Quiz was not created.'
    end  
      
  end

  
  def destroy
    @quiz = Quiz.find(params[:id]).destroy
    redirect_to @quiz, notice: 'Quiz was successfully deleted'
  end  

  
  def edit
      binding.pry
     @quiz = Quiz.find(params[:id])
    
  end

  def update
   
    @hunt = Hunt.find(params[:question_id])
    @quiz = Quiz.update(quiz_params)
    #@quiz = @hunt.quiz.update(answer_params)
    redirect_to @hunt, notice: 'Quiz was successfully updated'
  end 

 

  #private

  # Never trust parameters from the scary internet, only allow the white list through.
  def quiz_params
    params.require(:quiz).permit(:hunt_id, :question, :question_no, :address, :latitude, :longitude)
  end

  def user_signed_in?
    redirect_to root_path unless current_user
  end
end
