class MessagesController < ApplicationController

  def index
    @messages = Message.owned(current_user)
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