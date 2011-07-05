class AddUserTypeToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :user_type, :string, :limit => 50
  end

  def self.down
    remove_column :users, :user_type
  end
end
