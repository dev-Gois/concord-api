class UserChatRoom < ApplicationRecord
    belongs_to :user
    belongs_to :chat_room

    enum role: { admin: 0, member: 1 }

    after_create :notify_user

    private

    def notify_user
        ActionCable.server.broadcast(
            "user_#{user.id}",
            {
                type: "new_chat_room",
                chat_room: ChatRoomSerializer.new(chat_room).serializable_hash
            }
        )
    end
end
