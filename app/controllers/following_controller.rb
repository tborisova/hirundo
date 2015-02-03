class FollowingController < ApplicationController

  def create
    Following.create(user_id: current_user.id, followed_user_id: params[:id])
    
    redirect_to from_user_path(params[:id])
  end

  def destroy
    following = Following.where(user_id: current_user.id, followed_user_id: params[:id])
    following.destroy

    redirect_to from_user_path(params[:id])
  end
end