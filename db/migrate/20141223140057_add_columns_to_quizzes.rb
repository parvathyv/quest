class AddColumnsToQuizzes < ActiveRecord::Migration
  def change
  	add_column :quizzes, :quiz_no, :integer
  end
end
