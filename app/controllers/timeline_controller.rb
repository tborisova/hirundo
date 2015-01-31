class TimelineController < ApplicationController

  def index
    @messages = Message.in(user_id: current_user.list_of_followed_users) 
    #show all messages of users that the current user follows    
  end

  def from_user
    @messages = Message.owned(params[:id])
    #tweers from specific user
  end
end