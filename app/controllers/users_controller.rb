class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :show, :edit, :update, :destroy, :publichome, :profile]# user public homepage can be see
  before_filter :correct_user, only:[:edit, :update, :show, :profile]# all signed in user can see index
  before_filter :admin_user, only: :destroy # how to add an admin to database?
  before_filter :skip_password_attribute, only: :profile
  
  def new
    @user = User.new
  end
  
  def allinfo
    # all posts in time order
    @feed_items = Micropost.paginate(:include => :user, page: params[:page])
    # use include option to avoid n+1 Queries Problem
  end
  
  # def post
  #  encapsulate in show
  #   @micropost = current_user.microposts.build if signed_in?  # just create
  # end

  def show
    # user private  home page
    @user = User.find(params[:id])
    @current_group=Group.find(@user.current_group)
    
    @inbox_microposts=@current_group.microposts.paginate(:include => :user, page: params[:page])
    @outbox_microposts=current_user.my_group_posts.paginate(:include => :user, page: params[:page])
    
    @micropost = current_user.microposts.build if signed_in?#used for compose new pose
  end

  def create
    # sign in, called/together with new
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      #  join in default group
      @group=Group.first
      @user.join!(@group)
      flash[:success] = "Sign Up Successfully! Welcome!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def index
    #  show all users, pic, name, link to public home
    @users = User.paginate(page: params[:page])
    
  end
  
  def allgroup
    @groups = Group.all
    # There won't be too many groups
    # group validation need to be added
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    # user change password, called/together with edit
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
        # Handle a successful update.
        flash[:success] = "User Profile Setting updated" 
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
  end
  
  def profile
     @user = User.find(params[:id])     
     @groups = Group.all
     # @default_groups=Group.find([1,2,3,4])
#      @other_groups=@groups[4..-1]
     @joined_groups=@user.groups
     @unjoined_groups=@groups-@user.groups
     # @other_groups.each do |group| 
#        if current_user.joining?(group)
#          # @joined_groups.push(group)
#        else
#          @unjoined_groups.push(group)
#        end
#      end
     
     # @relationships = Relationship.all
     #  used for create new group
     @group = current_user.groups.build
         
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