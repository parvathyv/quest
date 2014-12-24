class AddIndexToQuizzes < ActiveRecord::Migration
  def change
  	add_index :quizzes, [:location_id, :hunt_id], unique: true
  end
end
