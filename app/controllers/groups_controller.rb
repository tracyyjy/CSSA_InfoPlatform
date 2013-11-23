class GroupsController < ApplicationController
 
  def create
      @group = Group.new(params[:group])
      if @group.save
        flash[:success] = "Create Group success!"
        redirect_to profile_user_path(current_user)
      else
        flash[:success] = "Fail to add Group, Group already exist or name/description too Long !"
        redirect_to profile_user_path(current_user)
      end
      
    
  end
  
  def destroy 
    Group.find(params[:id]).destroy
    flash[:success]="Group Destroyed by Admin"
    redirect_to current_user
  end

end
