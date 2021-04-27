class Public::MessagesController < ApplicationController
  def create
    @message = current_member.messages.new(message_params)
    @room = @message.room
    if @message.save
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @room = @message.room
    @message.destroy
  end

  private

  def message_params
    params.require(:message).permit(:room_id, :body)
  end

end
