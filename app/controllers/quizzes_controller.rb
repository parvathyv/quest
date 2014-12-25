
class QuizzesController < ApplicationController
  before_filter :user_signed_in?, :only => [:edit, :update, :destroy]
  # GET /quizzes
  def index
    @hunt = Hunt.find(params[:hunt_id])
    @quizzes = @hunt.quizzes
    @location_zoom = 8

    @location_array = []
    @quizzes.each{|obj| @location_array << [obj.latitude, obj.longitude]}
    #binding.pry
  end

  # GET /quizzes/1
  def show

    @quiz = Quiz.find(params[:id])
    @location_array = []
    @location_array << [@quiz.latitude, @quiz.longitude]
    @location_zoom = 12
  end

  # GET /quizzes/new
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
        redirect_to new_hunt_quiz_path(@hunt), notice: 'Question was successfully created.'
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

  def make_best_answer
    @quiz = Quiz.find(params[:id])
    @quiz.rating = true
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
