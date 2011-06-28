class CreateReferrals < ActiveRecord::Migration
  def self.up
    create_table :referrals do |t|
      t.string :first_name
      t.string :last_name
      t.string :customer_phone
      t.string :case_manager_name
      t.string :case_manager_email
      t.string :username
      t.text :note
      t.timestamps
    end
  end

  def self.down
    drop_table :referrals
  end
end
