class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :talk_room, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
      t.text :body

      t.timestamps
    end
  end
end
