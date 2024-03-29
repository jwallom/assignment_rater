class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :first_name
      t.string :last_name
      t.boolean :active
      t.boolean :instructor

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
