class ChangeColumnLocations < ActiveRecord::Migration
  def change
  	change_column_null :locations, :address, false
  end
end
