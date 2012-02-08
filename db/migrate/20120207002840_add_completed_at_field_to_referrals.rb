class AddCompletedAtFieldToReferrals < ActiveRecord::Migration
  def self.up
    change_table :referrals do |t|
      t.datetime :completed_at
      t.text :followup_notes
    end
  end

  def self.down
    change_table :referrals do |t|
      t.remove :completed_at
      t.remove :followup_notes
    end
  end
end
