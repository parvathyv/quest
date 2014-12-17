class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |table|
      table.string :description, null: false
      table.integer :user_id, null: false
      table.integer :question_id, null: false
      table.timestamps
    end
   add_index :answers, [:id, :user_id, :question_id], unique: true 

  end
end
