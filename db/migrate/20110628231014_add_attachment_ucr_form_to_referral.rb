class AddAttachmentUcrFormToReferral < ActiveRecord::Migration
  def self.up
    add_column :referrals, :ucr_form_file_name, :string
    add_column :referrals, :ucr_form_content_type, :string
    add_column :referrals, :ucr_form_file_size, :integer
    add_column :referrals, :ucr_form_updated_at, :datetime
  end

  def self.down
    remove_column :referrals, :ucr_form_file_name
    remove_column :referrals, :ucr_form_content_type
    remove_column :referrals, :ucr_form_file_size
    remove_column :referrals, :ucr_form_updated_at
  end
end
