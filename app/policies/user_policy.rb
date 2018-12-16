# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def login?
    true
  end
end
