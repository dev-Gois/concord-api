class RenameTypeToChatTypeInChatRooms < ActiveRecord::Migration[7.2]
  def change
    rename_column :chat_rooms, :type, :chat_type
  end
end
