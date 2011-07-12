class PagesController < ApplicationController
  before_filter :login_required

  def root
  end
end
