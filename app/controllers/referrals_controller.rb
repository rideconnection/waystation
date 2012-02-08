class ReferralQuery
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_reader :creator_type, :completed 

  CREATOR_TYPE_OPTIONS = %w{all inside outside}
  COMPLETED_OPTIONS = %w{all completed not_completed}

  def initialize(params,session)
    params ||= {}

    @creator_type = params[:creator_type] || session[:creator_type] || 'all'
    @completed = params[:completed] || session[:completed] || 'all'
    session[:creator_type] = @creator_type
    session[:completed] = @completed
  end

  def persisted?
    false
  end

  def apply_conditions(referrals)
    referrals = referrals.created_by_outside_user if creator_type == 'outside' 
    referrals = referrals.created_by_inside_user if creator_type == 'inside'
    referrals = referrals.completed if completed == 'completed'
    referrals = referrals.not_completed if completed == 'not_completed'
    referrals
  end
end

class ReferralsController < ApplicationController
  load_and_authorize_resource
  before_filter :login_required

  def index
    @query = ReferralQuery.new(params,session)
    @referrals = @query.apply_conditions(@referrals).order('created_at DESC')
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
    @referral.active = false
    @referral.save!
    redirect_to referrals_url, :notice => "Successfully destroyed referral."
  end

  def download
    send_file @referral.ucr_form.path, :type => @referral.ucr_form_content_type, :disposition => 'inline', :x_sendfile => true
  end
end
