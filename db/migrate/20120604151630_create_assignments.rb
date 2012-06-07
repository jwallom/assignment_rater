class CreateAssignments < ActiveRecord::Migration
  def self.up
    create_table :assignments do |t|
      t.text :prompt
      t.timestamp :start_date
      t.timestamp :end_date

      t.timestamps
    end
  end

  def self.down
    drop_table :assignments
  end
end
