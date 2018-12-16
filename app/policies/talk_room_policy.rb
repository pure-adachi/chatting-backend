# frozen_string_literal: true

class TalkRoomPolicy < ApplicationPolicy
  def create?
    user.present?
  end
end
