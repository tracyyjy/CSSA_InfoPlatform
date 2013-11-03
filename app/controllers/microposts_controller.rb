class MicropostsController < ApplicationController
  
  before_filter :signed_in_user
  before_filter :correct_user, only: :destroy
  
  def create
    @micropost = current_user.microposts.build(params[:micropost])
    if @micropost.save
      flash[:success] = "Post success!"
      redirect_to current_user
    else
      @feed_items = current_user.feed
      render current_user
    end
  end
  
  def destroy
    @micropost.destroy
    flash[:success] = "Delete success!"
    redirect_to current_user
  end
  
  private
    def correct_user
      @micropost = current_user.microposts.find_by_id(params[:id])
      redirect_to current_user if @micropost.nil?
    end
end
