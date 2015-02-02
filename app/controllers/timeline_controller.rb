class TimelineController < ApplicationController

  def followers
    @user = User.find(params[:id])
    @users = User.in(:id => Following.where(:followed_user_id => @user).map(&:user_id))
  end

  def followed
    @user = User.find(params[:id])
    @users = User.in(:id => @user.followed_users.map(&:followed_user_id))
  end
  
end