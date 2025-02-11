class RemoveChatTypeFromChatRoom < ActiveRecord::Migration[7.2]
  def change
    remove_column :chat_rooms, :chat_type, :integer
  end
end
