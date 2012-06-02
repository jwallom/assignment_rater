class AddSecurePasswordsToUsers < ActiveRecord::Migration
  def self.up
  	remove_column :users, :password
    add_column :users, :password_hash, :string
    add_column :users, :password_salt, :string
  end

  def self.down
    remove_column :users, :password_salt
    remove_column :users, :password_hash
    add_column :users, :password, :string
  end
end
