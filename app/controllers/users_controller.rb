class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @messages = @user.messages
  end

  def edit
    @user = User.find(params[:id])
  end

  def updated
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
  end

  def user_params
    params[:user].permit(:image, :description, :name)
  end
end