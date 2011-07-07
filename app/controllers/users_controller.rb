class UsersController < ApplicationController
  before_filter :login_required, :except => [:new_initial, :create_initial]

  def index
    @users = User.order(:username).all
  end

  def new_initial
    if User.count > 0 then
      if logged_in?
        redirect_to root_url
      else
        redirect_to login_url, :alert => "You must first log in or sign up before accessing this page."
      end
    else
      @user = User.new
    end
  end

  def create_initial
    if User.count > 0 then
      if logged_in?
        redirect_to root_url
      else
        redirect_to login_url, :alert => "You must first log in or sign up before accessing this page."
      end
    else
      @user = User.new(params[:user])
      @user.active = true
      @user.user_type = 'Admin'
      if @user.save
        redirect_to users_path, :notice => "New user successfully created."
      else
        render :action => 'new'
      end
    end
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
