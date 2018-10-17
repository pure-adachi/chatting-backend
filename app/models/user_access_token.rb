class UserAccessToken < ApplicationRecord
  belongs_to :access_token
  belongs_to :user
end
