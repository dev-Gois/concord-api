class CreateUserChatRooms < ActiveRecord::Migration[7.2]
  def change
    create_table :user_chat_rooms do |t|
      t.references :user, null: false, foreign_key: true
      t.references :chat_room, null: false, foreign_key: true
      t.integer :role, default: 0, null: false

      t.timestamps
    end
  end
end
