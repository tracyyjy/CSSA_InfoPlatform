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
end