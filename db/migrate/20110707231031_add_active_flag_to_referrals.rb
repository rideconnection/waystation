class AddActiveFlagToReferrals < ActiveRecord::Migration
  def self.up
    add_column :referrals, :active, :boolean, :default => true
  end

  def self.down
    remove_column :referrals, :active
  end
end
