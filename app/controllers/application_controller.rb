# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :authenticate_user
  attr_reader :current_user

  private

  def authenticate_user
    return if access_token.blank?

    token = AccessToken.find_by(token: access_token)
    @current_user = token&.user
  end

  def access_token
    request.authorization&.gsub(/^Bearer /, '')
  end
end
