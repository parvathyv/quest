require 'open-uri'
class QuizzesController < ApplicationController
  before_filter :user_signed_in?, :only => [:edit, :update, :destroy]
  # GET /quizzes
  def index
     @lat = params[:lat]
     binding.pry
    #@hunt = Hunt.find(params[:hunt_id])
    #@quizzes = @hunt.quizzes
    @location_zoom = 8

    #@location_array = []
    #@quizzes.each{|obj| @location_array << [obj.latitude, obj.longitude]}
    #binding.pry
  end

  def get_clue
   
   search_item = Quiz.find(params[:id]).address

  
  if search_item == '' ||  search_item == nil
    search_parameter = "Yellowstone_National_Park"
  else
    search_item = search_item.split(',').first

    search_item = search_item.split(' ').each { | word | word.capitalize! }.join(' ')
       
    if search_item.strip.size > 1 
          search_item = search_item.split(' ').join('_')
    end 
    
   
    search_parameter = search_item
  end 
  
 
 
  url = "http://en.wikipedia.org/wiki/#{search_parameter}"
  doc = Nokogiri::HTML(open(url).read)
  
  characters = doc.css("#mw-content-text p")
   binding.pry 
  latitude = doc.css(".latitude").first.to_s
  longitude= doc.css(".longitude").first.to_s
  
  paragraph = characters[1].to_s
  
  #paragraph1 = characters[1].to_s
  #search_parameter = search_parameter.split('_').join(' ')
  
  #paragraph = paragraph.gsub(search_parameter, '---') 
  #paragraph1 = paragraph1.gsub(search_parameter, '---')

  #paragraph = paragraph.gsub(search_parameter.split(' ').first,'---') 
  #paragraph1 = paragraph1.gsub(search_parameter.split(' ').first,'---')
  #binding.pry
  
  @characters = "#{paragraph}"
  
  
  end  

  # GET /quizzes/1
  def show
   
    @quiz = Quiz.find(params[:id])
    @location_array = []
    @location_array << [@quiz.latitude, @quiz.longitude]
    @location_zoom = 12
    @characters = get_clue

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
