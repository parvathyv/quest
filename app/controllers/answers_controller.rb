require 'pry-rails'
class AnswersController < ApplicationController

  # GET /answers
  def index
    @answers = Answer.all
  end

  # GET /answers/1
  def show
    @answer = Answer.find(params[:id])
  end

  # GET /answers/new
  def new

    @answer = Answer.new
    
   
  end

  # POST /answers
  def create
     
    @answer= Answer.new(description: params[:answer][:description], question_id: params[:question_id],user_id: 1)

    if @answer.save
      redirect_to @answer, notice: 'Answer was successfully created.'
    else
      render action: 'new'
    end
  end

  # GET /answers/search
  def search
    query = "%#{params[:query]}%"
    @answers = Answer.where('title like ? or description like ? or url like ?',
             query, query, query)
  end
  
  def destroy
    @answer = Answer.find(params[:id]).destroy
    redirect_to @answer, notice: 'Answer was successfully deleted'
  end  

  
  def edit
  
     @answer = Answer.find(params[:id])
    
  end

  def update
    binding.pry
    @answer = Answer.update(params[:id],  description: params[:answer][:description])
    redirect_to @answer, notice: 'Answer was successfully updated'
  end 


  #private

  # Never trust parameters from the scary internet, only allow the white list through.
  #def question_params
  #  params.require(:answer).permit(:title, :description, :url, :submitter)
  #end
end
