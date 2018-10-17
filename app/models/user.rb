class User < ApplicationRecord
  has_many :user_access_tokens, dependent: :destroy
  has_many :access_tokens, through: :user_access_tokens
end
