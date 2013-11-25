class HomePageController < ApplicationController

  def home
    sign_in User.find(2)
  end

end
