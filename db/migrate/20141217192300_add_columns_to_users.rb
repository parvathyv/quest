class AddColumnsToUsers < ActiveRecord::Migration
  # omniauth columns
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :name, :string
    add_column :users, :avatar_url, :string
    add_index :users, [:uid, :provider], unique: true
  end
end
