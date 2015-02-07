class UsersController < ApplicationController
  layout "timeline"
  
  def index
    @users = User.not.in(id: current_user.id)
  end
end