class RemoveColumnHunts < ActiveRecord::Migration
  def change
  	remove_column :hunts, :quiz_id, :integer
  end
end
