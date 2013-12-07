class RelationshipsController <ApplicationController
  before_filter :signed_in_user
  
  def create # actually delete
      @group=Group.find(params[:relationship][:joined_id])
      current_user.join!(@group)
      #@group=Relationship.find(params[:id]).joined
      #      current_user.unjoin!(@group)
      flash[:success] = "Group Setting create" 
      redirect_to profile_user_path(current_user)
  end
  
  def update
      # @group=Group.find(params[:relationship][:joined_id])
      # current_user.join!(@group)
      flash[:success] = "Group Setting updated" 
      redirect_to profile_user_path(current_user)
  end
  
  def destroy
      @group=Relationship.find(params[:id]).joined
      current_user.unjoin!(@group)
      flash[:success] = "Group Setting destroy" 
      redirect_to profile_user_path(current_user)
  end
  
end