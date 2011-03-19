class AddNameAndBioToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :user_name, :string, :limit => 75
    add_column :users, :full_name, :string, :limit => 75
    add_column :users, :bio, :text, :null => false, :default => ''
    add_column :users, :location, :string, :limit => 75
    change_column :users, :role, :string, :null => false, :default => 'user'
    add_index :users, :user_name, :name => 'user_name_index', :unique => true
  end

  def self.down
    remove_column :users, :user_name
    remove_column :users, :full_name
    remove_column :users, :bio
    remove_column :users, :location
    change_column :users, :role, :string
    remove_index :users, 'user_name_index'
  end
end
