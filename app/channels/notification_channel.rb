class NotificationChannel < ApplicationCable::Channel
  def subscribed
    stream_from "question"
  end
end
