require 'pry'
class UsersController < ApplicationController

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  def create

    @user= User.new(username: params[:user][:username], email: params[:user][:email])

    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render action: 'new'
    end
  end

  # GET /users/search
  def search
    query = "%#{params[:query]}%"
    @users = User.where('title like ? or description like ? or url like ?',
             query, query, query)
  end
  
  def destroy
    @user = User.find(params[:id]).destroy
  end  
  #private

  # Never trust parameters from the scary internet, only allow the white list through.
  #def question_params
  #  params.require(:user).permit(:title, :description, :url, :submitter)
  #end
end
