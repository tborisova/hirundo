class FollowingController < ApplicationController

  def create
    Following.create(user_id: current_user.id, followed_user_id: params[:id])
    redirect_to root_path
  end

  def destroy
  end
end