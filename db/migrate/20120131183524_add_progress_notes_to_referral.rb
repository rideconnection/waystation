class AddProgressNotesToReferral < ActiveRecord::Migration
  def self.up
    change_table :referrals do |t|
      t.text :progress_notes
      t.boolean :completed
    end
  end

  def self.down
    change_table :referrals do |t|
      t.remove :progress_notes
    end
  end
end
