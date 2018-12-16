# frozen_string_literal: true

class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    message.talk_room.users.each do |user|
      ActionCable.server.broadcast user.stream_key, message: message
    end
  end
end
