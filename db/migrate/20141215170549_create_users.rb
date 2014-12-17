class CreateUsers < ActiveRecord::Migration
  def change
     create_table :users do |table|
      table.string :provider
      table.string :uid 
      table.string :username, null: false
      table.string :email, null: false
      table.string :avatar_url 
      table.string :role
      table.timestamps
    end

    add_index :users, [:uid, :provider], unique: true
  end
end
