class CreateUserTalkRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :user_talk_rooms do |t|
      t.references :user,      foreign_key: true, null: false
      t.references :talk_room, foreign_key: true, null: false

      t.timestamps
    end
  end
end
