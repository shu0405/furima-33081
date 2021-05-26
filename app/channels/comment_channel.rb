class CommentChannel < ApplicationCable::Channel
  def subscribed
    stream_from "comment  _channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
