# frozen_string_literal: true

class TalkRoom < ApplicationRecord
  has_many :user_talk_rooms, dependent: :destroy
  has_many :users, through: :user_talk_rooms
  has_many :messages
end
