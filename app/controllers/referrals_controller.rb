class ReferralsController < ApplicationController
  def index
    @referrals = Referral.all
  end

  def show
    @referral = Referral.find(params[:id])
  end

  def new
    @referral = Referral.new
  end

  def create
    @referral = Referral.new(params[:referral])
    if @referral.save
      redirect_to @referral, :notice => "Successfully created referral."
    else
      render :action => 'new'
    end
  end

  def edit
    @referral = Referral.find(params[:id])
  end

  def update
    @referral = Referral.find(params[:id])
    if @referral.update_attributes(params[:referral])
      redirect_to @referral, :notice  => "Successfully updated referral."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @referral = Referral.find(params[:id])
    @referral.destroy
    redirect_to referrals_url, :notice => "Successfully destroyed referral."
  end
end