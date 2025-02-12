class ChatRoomSerializer
  include JSONAPI::Serializer
  attributes :id, :name

  attribute :members do |chat_room|
    UserChatRoomSerializer.new(chat_room.user_chat_rooms).serializable_hash[:data].map { |user_chat_room| user_chat_room[:attributes] }
  end

  attribute :messages do |chat_room|
    MessageSerializer.new(chat_room.messages).serializable_hash[:data].map { |message| message[:attributes] }
  end
end
