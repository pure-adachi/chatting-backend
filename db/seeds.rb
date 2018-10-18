# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

(1..3).each do |i|
  User.find_or_create_by(sei: 'テスト', mei: "#{i}郎") do |u|
    u.loginid  = "loginid#{i}"
    u.password = "password"
    u.language = I18n.default_locale
  end.access_tokens.find_or_create_by(token: ENV['RAILS_APP_BEARER_TOKEN'])
end
