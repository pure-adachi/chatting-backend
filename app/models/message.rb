# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :talk_room
  belongs_to :user

  after_create_commit { MessageBroadcastJob.perform_later self }

  scope :order_latest, -> { order(created_at: :desc) }
end
