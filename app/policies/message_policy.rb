# frozen_string_literal: true

class MessagePolicy < ApplicationPolicy
  def create?
    user.present? && record.users.where(id: user.id).present?
  end
end
