class AccessToken < ApplicationRecord
  has_one :user_access_token, dependent: :destroy
  has_one :user, through: :user_access_token

  before_validation :set_token, if: :new_record?

  scope :order_latest, -> { order(created_at: :desc) }

  private

  def set_token
    self.token = SecureRandom.uuid if token.blank?
  end
end
