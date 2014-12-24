class RemoveColumnLocations < ActiveRecord::Migration
  # to include geocoder, the column has to be specifically named address	
  def change
  	remove_column :locations, :name, :string
  end
end
