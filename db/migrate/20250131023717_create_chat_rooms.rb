class CreateChatRooms < ActiveRecord::Migration[7.2]
  def change
    create_table :chat_rooms do |t|
      t.string :name, null: false
      t.integer :type, null: false

      t.timestamps
    end
  end
end
