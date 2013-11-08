class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update, :destroy, :publichome, :profile]# user public homepage can be see
  before_filter :correct_user, only:[:edit, :update, :publichome, :profile]# all signed in user can see index
  before_filter :admin_user, only: :destroy # how to add an admin to database?
  before_filter :skip_password_attribute, only: :profile
  
  def new
    @user = User.new
  end
  
  def allinfo
    # @feed_items = current_user.feed
    @feed_items =Micropost.all
  end
  
  def post
    @micropost = current_user.microposts.build if signed_in?  # just create
  end

  def show
    @user = User.find(params[:id])
    @microposts =@user.microposts #.paginate(page: params[:page]) #just show
    @micropost = current_user.microposts.build if signed_in?  # just create
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
    @groups = Group.all
    
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
        # Handle a successful update.
        flash[:success] = "Profile Setting updated" 
        sign_in @user
        redirect_to @user
    else
      render 'edit' 
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success]="User Destroyed"
    redirect_to users_path
  end
  
  def publichome
     @user = User.find(params[:id])
     if signed_in? 
       @micropost = current_user.microposts.build #used for create post
       @microposts =@user.microposts #.paginate(page: params[:page])# used for display
       @feed_items = current_user.feed
     end
  end
  
  def profile
     @user = User.find(params[:id])
     @groups = Group.all
     @relationships = Relationship.all
     
     
     
  end
  
  
  private
#   defined in helper
  # def signed_in_user
  #   unless signed_in?
  #     store_location
  #     redirect_to signin_path, notice: "Please Sign in."
  #   end
  # end
  
  def correct_user
    @user = User.find(params[:id])
    # which path should user be redirected? root_path or current_user
    redirect_to current_user, notice: "You don't hace access to other's page." unless current_user?(@user)
  end
  
  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end
  
  def skip_password_attribute
    if params[:password].blank? && params[:password_confirmation].blank?  
      params.except!(:password, :password_confirmation)
    end
  end
  
end
