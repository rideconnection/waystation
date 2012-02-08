class Referral < ActiveRecord::Base
  stampable :stamper_class_name => :user,
                    :creator_attribute  => :created_by,
                    :updater_attribute  => :updated_by
  #attr_accessible :first_name, :last_name, :customer_phone, :case_manager_name, :case_manager_email, :note

  belongs_to :creator, :class_name => 'User', :foreign_key => :created_by
  belongs_to :updater, :class_name => 'User', :foreign_key => :updated_by

  has_attached_file :ucr_form, 
      :path => ":rails_root/uploads/:class/:id/:basename.:extension",
      :url => "/referrals/:id/download"

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :customer_phone
  validates_presence_of :case_manager_name
  validates_presence_of :case_manager_email
  #validates_attachment_presence :ucr_form

  scope :created_by_outside_user, joins(:creator).where(:users => {:user_type => 'Outside User'})
  scope :created_by_inside_user, joins(:creator).where(:users => {:user_type => ['Service Center User','Admin','Coach']})
  scope :not_completed, where(:completed_at => nil)
  scope :completed, where("referrals.completed_at IS NOT NULL")
  
  def name
    "#{last_name}, #{first_name}"
  end

  def completed
    !completed_at.nil?
  end

  def completed=(value)
    if value == "1" || value == true
      self.completed_at = Time.now
    else
      self.completed_at = nil
    end
  end
end
