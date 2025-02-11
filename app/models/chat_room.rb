class ChatRoom < ApplicationRecord
    has_many :user_chat_rooms
    has_many :users, through: :user_chat_rooms
    has_many :messages

    validates :name, presence: true
    validates :chat_type, presence: true
end
