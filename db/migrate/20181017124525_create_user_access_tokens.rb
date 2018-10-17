class CreateUserAccessTokens < ActiveRecord::Migration[5.2]
  def change
    create_table :user_access_tokens do |t|
      t.references :user,         foreign_key: true, null: false
      t.references :access_token, foreign_key: true, null: false

      t.timestamps
    end
  end
end
