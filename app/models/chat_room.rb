class ChatRoom < ApplicationRecord
    enum chat_type: { private_chat: 0, group_chat: 1 }

    validates :name, presence: true
    validates :chat_type, presence: true
end
