class QuestionsController < ApplicationController

  # GET /questions
  def index
    @questions = Question.order(id: :DESC)
  end

  # GET /questions/1
  def show
 
    @question = Question.find(params[:id])
   
    @answer= Answer.new
    

    @answers = Answer.where('question_id =?', params[:id]).order(updated_at: :desc)
   

  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # POST /questions
  def create
    #@user = User.new(username: params[:name], email: params[:email])
     @question= Question.new(title: params[:question][:title], description: params[:question][:description], category: params[:question][:category],user_id: 1)

    if @question.save
      redirect_to new_question_path, notice: 'Question was successfully created.'
    else
      render action: 'new'
    end
  end
  

  def destroy

    @question = Question.find(params[:id]).destroy
    redirect_to @question, notice: 'Question was successfully deleted'
  end  
 

  def edit
  
     @question = Question.find(params[:id])
    
  end

  def update
    @question = Question.find(params[:id])

    @question.update(title: params[:question][:title], description: params[:question][:description], category: params[:question][:category])
    binding.pry
    if @question.save
      redirect_to @question, notice: 'Question was successfully created.'
    else
      render action: 'edit'
    end
  end  
  
  
  # GET /questions/search
  def search
    query = "%#{params[:query]}%"
    @questions = Question.where('title like ? or description like ? or url like ?',
             query, query, query)
  end
  
  
  #private

  # Never trust parameters from the scary internet, only allow the white list through.
  #def question_params
  #  params.require(:question).permit(:title, :description, :url, :submitter)
  #end
end
