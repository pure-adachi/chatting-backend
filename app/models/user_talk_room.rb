# frozen_string_literal: true

class UserTalkRoom < ApplicationRecord
  belongs_to :user
  belongs_to :talk_room
end
