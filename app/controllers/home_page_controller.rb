class HomePageController < ApplicationController
  
  caches_page :home
  
  def home
    
  end
  
  def create
    expire_page :action => :home
  end

end
