class ChatRoom < ApplicationRecord
    has_many :user_chat_rooms
    has_many :users, through: :user_chat_rooms
    enum chat_type: { private_chat: 0, group_chat: 1 }

    validates :name, presence: true
    validates :chat_type, presence: true
end
