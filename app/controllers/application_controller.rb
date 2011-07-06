class ApplicationController < ActionController::Base
  include ControllerAuthentication
  include Userstamp
  protect_from_forgery
end
