class MessageChannel < ApplicationCable::Channel
  def subscribed
    stream_from "message_channel_#{params[:chat_id]}" 
  end

  def unsubscribed
    # Message.destroy_all
    # Any cleanup needed when channel is unsubscribed
  end
end
