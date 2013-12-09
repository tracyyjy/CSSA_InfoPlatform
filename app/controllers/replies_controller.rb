class RepliesController < ApplicationController
  
  # before_filter :signed_in_user, only: [:create, :destroy]
#   before_filter :correct_user, only: :destroy
  
  def create
    
    
    @reply = current_user.replies.build(params[:reply])
    if @reply.save
      flash[:success] = "Reply success!"
      redirect_to current_user
    else
      # @feed_items =[]
      # @feed_items = current_user.feed
      flash[:success] = "Fail to save Reply !"
      render publichome_user_path(current_user) # not current_user
    end
  end
  
  def destroy 
    @reply.destroy
    redirect_to current_user
  end
  
  # private
  #   def correct_user
  #     @micropost = current_user.microposts.find_by_id(params[:id])
  #     redirect_to current_user if @micropost.nil?
  #   end
end
