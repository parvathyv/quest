class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |table|
      table.string :title, null: false
      table.string :description, null: false 
      table.string :category, null: false
      table.integer :user_id, null: false
      table.timestamps
    end
   add_index :questions, [:id, :user_id], unique: true 
  end
end
