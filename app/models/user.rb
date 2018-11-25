class User < ApplicationRecord
  has_many :user_access_tokens, dependent: :destroy
  has_many :access_tokens, through: :user_access_tokens
  has_many :user_talk_rooms, dependent: :destroy
  has_many :talk_rooms, through: :user_talk_rooms
  has_many :messages, dependent: :destroy

  validates :loginid, presence: true
  validates :password, presence: true

  validate :validation_authentication, on: :login

  def latest_acess_token
    access_tokens.order_latest.first&.token
  end

  def stream_key
    "user-channel-#{guid}"
  end

  private

  def validation_authentication
    return if loginid.blank?
    return if password.blank?
    return if self.class.find_by(loginid: loginid, password: password).present?
    errors.add(:base, :unauthorized)
  end
end
