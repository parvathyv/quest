class AddColumnToQuizzes < ActiveRecord::Migration
  def change
  	add_column :quizzes, :address, :string
  end
end
