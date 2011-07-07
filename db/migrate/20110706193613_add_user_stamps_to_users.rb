class AddUserStampsToUsers < ActiveRecord::Migration
  def self.up
    change_table :referrals do |t|
      t.integer :created_by
      t.integer :updated_by
    end
  end

  def self.down
    change_table :referrals do |t|
      t.remove :created_by
      t.remove :updated_by
    end
  end
end
