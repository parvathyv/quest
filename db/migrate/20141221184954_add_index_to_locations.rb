class AddIndexToLocations < ActiveRecord::Migration
  def change
  	 add_index :locations, [:latitude, :longitude], unique: true
  end
end
