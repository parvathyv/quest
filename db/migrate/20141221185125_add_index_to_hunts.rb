class AddIndexToHunts < ActiveRecord::Migration
  def change
  	add_index :hunts, [:location_id, :user_id], unique: true
  end
end
