class AddRemColumnsToQuizzes < ActiveRecord::Migration
  def change
  	remove_column :quizzes, :location_id, :integer
  	add_column :quizzes, :latitude, :float
  	add_column :quizzes, :longitude, :float
  end
end
