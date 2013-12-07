<<<<<<< HEAD
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
  
=======
class RelationshipsController < ApplicationController
  
  before_filter :signed_in_user
  before_filter :correct_user, only: :destroy
  
  def create
    @relationship = current_user.relationships.build(params[:relationship])
    if @relationship.save
      flash[:relationship] = "Post success!"
      redirect_to current_user
    else
      @feed_items = current_user.feed
      render current_user
    end
  end
  
  def destroy 
    @relationship.destroy
    redirect_to current_user
  end
  
  private
    def correct_user
      @relationship = current_user.relationships.find_by_id(params[:id])
      redirect_to current_user if @relationship.nil?
    end
>>>>>>> fee860efb27c8a9a1fc4bca633ae53b0f53030c3
end