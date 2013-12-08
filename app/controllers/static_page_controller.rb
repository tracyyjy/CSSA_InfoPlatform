class StaticPageController < ApplicationController
  caches_page :index
  
  def index
    @users = User.all
  end
  
  def help
  end
  
  def create
    expire_page :action => :index
  end

end