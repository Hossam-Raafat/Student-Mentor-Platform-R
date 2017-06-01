class NotificationChannel < ActionCable::Channel
  def subscribed
    stream_from "question" 
  end
end
