class ChatRoomSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :chat_type

  attribute :members do |chat_room|
    UserChatRoomSerializer.new(chat_room.user_chat_rooms).serializable_hash[:data].map { |user_chat_room| user_chat_room[:attributes] }
  end
end
