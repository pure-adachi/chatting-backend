class UserPolicy < ApplicationPolicy
  def login?
    true
  end
end
