# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3.times do |i|
  User.find_or_create_by(sei: 'テスト', mei: "#{User.count + 1}郎") do |u|
    u.loginid  = "loginid#{User.count + 1}"
    u.password = "password"
    u.language = I18n.default_locale
    u.kana_sei = 'カナセイ'
    u.kana_mei = "カナメイ#{User.count + 1}"
  end.access_tokens.find_or_create_by(token: ENV['RAILS_APP_BEARER_TOKEN'])
  p "Create #{i + 1} User."
end

User.all.to_a.combination(2).each do |combi|
  talk_room = TalkRoom.new
  talk_room.users += combi
  ("A".."C").each do |text|
    talk_room.messages.new(body: text, user: combi[0])
  end

  ("D".."F").each do |text|
    talk_room.messages.new(body: text, user: combi[1])
  end

  talk_room.save
end

100.times do |i|
  User.find_or_create_by(sei: 'テスト', mei: "#{User.count + 1}郎") do |u|
    u.loginid  = "loginid#{User.count + 1}"
    u.password = "password"
    u.language = I18n.default_locale
  end

  p "Create #{i + 1} User."
end
