class QuestionChannel < ApplicationCable::Channel
  def subscribed
    puts "there"
    stream_from stream_name
  end

  def receive(data)
    puts @data
    ActionCable.server.broadcast stream_name, data.fetch('message')
  end

  def send_a_message(data)
    puts @data
    ActionCable.server.broadcast stream_name, data.fetch('message')
  end

  private

  def stream_name
    "new_question"
  end

  # def chat_id
  #   params.fetch('data').fetch('chat')
  # end
end