class RemoveIndexHunts < ActiveRecord::Migration
  def change
  	remove_index :hunts, column: [:user_id, :location_id]
  end
end
