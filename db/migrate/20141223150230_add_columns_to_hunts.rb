class AddColumnsToHunts < ActiveRecord::Migration
  def change
  	add_column :hunts, :description, :text
  end
end
