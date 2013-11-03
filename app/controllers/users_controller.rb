class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update]# user public homepage can be see
  before_filter :correct_user, only:[:edit, :update]# all signed in user can see index
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Sign Up Successfully! Welcome!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def index
    @users = User.all
    
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
        # Handle a successful update.
        flash[:success] = "Profile updated" 
        sign_in @user
        redirect_to @user
    else
      render 'edit' 
    end
  end
  
  private
  
  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_path, notice: "Please Sign in."
    end
  end
  def correct_user
    @user = User.find(params[:id])
    # which path should user be redirected? root_path or current_user
    redirect_to current_user, notice: "You don't hace access to other's page." unless current_user?(@user)
  end
    
end
