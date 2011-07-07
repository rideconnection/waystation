class ReferralsController < ApplicationController
  load_and_authorize_resource
  before_filter :login_required

  def index
  end

  def show
  end

  def new
  end

  def create
    if @referral.save
      redirect_to @referral, :notice => "Successfully created referral."
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @referral.update_attributes(params[:referral])
      redirect_to @referral, :notice  => "Successfully updated referral."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @referral.destroy
    redirect_to referrals_url, :notice => "Successfully destroyed referral."
  end

  def download
    #@referral = Referral.find(params[:id])
    send_file @referral.ucr_form.path, :type => @referral.ucr_form_content_type, :disposition => 'inline', :x_sendfile => true
  end
end
