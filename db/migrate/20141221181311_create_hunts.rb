class CreateHunts < ActiveRecord::Migration
  def change
    create_table :hunts do |t|
      t.string :name, null: false 
      t.integer :location_id, null: false
	  t.integer :trivia_id, null: false
	  t.integer :user_id, null: false
	  t.string :category
      t.timestamps
    end
  end
end
