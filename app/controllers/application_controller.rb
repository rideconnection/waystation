class ApplicationController < ActionController::Base
  include ControllerAuthentication
  include Userstamp
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    render :file => "#{Rails.root}/public/403.html", :status => 403
  end

  def test_exception_notification
      raise 'Testing, 1 2 3.'
  end
end
