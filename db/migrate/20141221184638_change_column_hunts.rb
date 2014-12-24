class ChangeColumnHunts < ActiveRecord::Migration
  def change
  	rename_column :hunts, :trivia_id, :quiz_id
  end
end
