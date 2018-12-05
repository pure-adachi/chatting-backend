class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.boolean    :admin, default: false, null: false
      t.string     :sei
      t.string     :mei
      t.string     :kana_sei
      t.string     :kana_mei
      t.string     :loginid
      t.string     :password
      t.string     :language
      t.integer    :lock_version,               default: 0,     null: false
      t.boolean    :deleted,                    default: false, null: false

      t.timestamps
    end
  end
end
