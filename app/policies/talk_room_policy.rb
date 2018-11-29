class TalkRoomPolicy < ApplicationPolicy
  def create?
    user.present?
  end
end
