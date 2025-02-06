class UserChatRoom < ApplicationRecord
    belongs_to :user
    belongs_to :chat_room
  
    enum role: { admin: 0, member: 1 }
  end