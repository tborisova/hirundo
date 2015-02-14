class MessagesController < ApplicationController
  layout "timeline"

  def index
    @messages = Message.in(user_id: current_user.followed_users.map(&:followed_user_id)).sort(_id: -1).limit(50)
  end

  def from_user
    @messages = Message.where(user_id: params[:id])
  end

  def show
    @message = Message.find(params[:id])
  end

  def create
    @message = Message.new(message_params.merge(user_id: current_user.id))

    if @message.save
      redirect_to action: :index
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
    @message = Message.update(message_params)
  end

  def destroy
    @message = Message.find(params[:id]).destroy
  end

  def message_params
      params.require(:message).permit(:content, :place_of_publishing)
  end

end