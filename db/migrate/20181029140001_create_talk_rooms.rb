class CreateTalkRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :talk_rooms do |t|
      t.string  :title
      t.boolean :group, default: false, null: false
      t.timestamps
    end
  end
end
