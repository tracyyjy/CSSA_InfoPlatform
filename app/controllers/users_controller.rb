class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Sign Up Successfully! Welcome!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def index
    @user = User.new(params[:user])
    render 'new'
  end
end
