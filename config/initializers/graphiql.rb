if Rails.env.development?
  GraphiQL::Rails.config.headers['Authorization'] = ->(_context) {
    "Bearer #{ENV['RAILS_APP_BEARER_TOKEN']}"
  }
end
