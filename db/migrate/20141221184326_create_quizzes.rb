class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.integer :location_id, null: false
	  t.integer :hunt_id, null: false
	  t.string :question, null: false
      t.timestamps
    end
  end
end
