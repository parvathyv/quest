class ChangeColumnsQuizzes < ActiveRecord::Migration
  def change
  	rename_column :quizzes, :quiz_no, :question_no
  end
end
