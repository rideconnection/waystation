class Referral < ActiveRecord::Base
  stampable :stamper_class_name => :user,
                    :creator_attribute  => :created_by,
                    :updater_attribute  => :updated_by
  #attr_accessible :first_name, :last_name, :customer_phone, :case_manager_name, :case_manager_email, :note

  has_attached_file :ucr_form, 
      :path => ":rails_root/uploads/:class/:id/:basename.:extension",
      :url => "/referrals/:id/download"
end
