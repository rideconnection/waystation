class UsersController < ApplicationController
  before_filter :login_required

  def index
    @users = User.order(:username).all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to users_path, :notice => "New user successfully created."
    else
      render :action => 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to users_path, :notice => "New user successfully created."
    else
      render :action => 'edit'
    end
  end
end
