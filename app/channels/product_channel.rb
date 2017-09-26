class ProductChannel < ApplicationCable::Channel
  def subscribed
    stream_from "product_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
  ActionCable.server.broadcast 'product_channel', comment: "Hello World", average_rating: 5
#oder n anderes file?
end
