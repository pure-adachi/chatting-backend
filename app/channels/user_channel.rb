class UserChannel < ApplicationCable::Channel
  def subscribed
    stream_from current_user.stream_key

    # binding.pry
    # stop_all_streams
  end

  def unsubscribed
    stop_all_streams
  end

  # def online(data)
  #   user_id = data["id"]
  #   Rails.logger.info "Channel ====================="
  #   Rails.logger.info "Channel ====================="
  #   Rails.logger.info "Channel ====================="
  #   Rails.logger.info "Channel ====================="
  #   Rails.logger.info "Channel ====================="
  #   Rails.logger.info "Channel ====================="
  #   Rails.logger.info "Channel #{user_id}"
  #   Rails.logger.info "Channel ====================="
  #   Rails.logger.info "Channel ====================="
  #   Rails.logger.info "Channel ====================="
  #   Rails.logger.info "Channel ====================="
  #   Rails.logger.info "Channel ====================="
  #   Rails.logger.info "Channel ====================="
  #   Rails.logger.info "Channel ====================="
  #   user = User.locate(user_id)
  #   return if user.blank?
  #   stop_all_streams
  #   stream_from user.stream_key
  # end
end
