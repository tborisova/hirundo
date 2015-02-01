class TimelineController < ApplicationController

  def followers
    @user = User.find(params[:id])
    @users = User.in(:id => Following.where(:followed_user_id => @user).map(&:user_id))
  end

  def followed
    @user = User.find(params[:id])
    @users = User.in(:id => @user.followed_users.map(&:followed_user_id))
    p @users.count
    p 'SSSS'
    p @users.first.email
    p @user
    # ids = Following.wher/e(:user_id => @user)
    # @users = User.in(:id)
    # @users = Following.where(:user_id => user_on_page)
  end
  
end