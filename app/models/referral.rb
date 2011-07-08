class Referral < ActiveRecord::Base
  stampable :stamper_class_name => :user,
                    :creator_attribute  => :created_by,
                    :updater_attribute  => :updated_by
  #attr_accessible :first_name, :last_name, :customer_phone, :case_manager_name, :case_manager_email, :note

  has_attached_file :ucr_form, 
      :path => ":rails_root/uploads/:class/:id/:basename.:extension",
      :url => "/referrals/:id/download"

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :customer_phone
  validates_presence_of :case_manager_name
  validates_presence_of :case_manager_email
  validates_attachment_presence :ucr_form
  
  def name
    "#{last_name}, #{first_name}"
  end
end
