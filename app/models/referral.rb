class Referral < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :customer_phone, :case_manager_name, :case_manager_email, :note
end