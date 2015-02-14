class MessagesController < ApplicationController
  layout "timeline"

  def index
    @messages = Message.in(user_id: current_user.followed_users.map(&:followed_user_id)).sort(_id: -1).limit(50)
  end

  def from_user
    @messages = Message.where(user_id: params[:id]).sort(_id: -1).limit(50)
  end

  def show
    @message = Message.find(params[:id])
  end

  def create
    @message = Message.new(message_params.merge(user_id: current_user.id))

    if @message.save
      redirect_to from_user_path(current_user)
    else
      render :new
    end
  end

  def new
    @message = Message.new
  end

  def edit
    @message = Message.find(params[:id])
  end

  def update
    @message = Message.find(params[:id])
    @message.update_attributes(message_params)
    redirect_to from_user_path(current_user)  
  end

  def destroy
    @message = Message.find(params[:id]).destroy
    redirect_to from_user_path(current_user)
  end

  def message_params
      params.require(:message).permit(:content, :place_of_publishing)
  end

end