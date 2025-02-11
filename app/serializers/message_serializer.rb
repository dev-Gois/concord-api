class MessageSerializer
  include JSONAPI::Serializer

  attributes :content, :chat_room_id, :user_id
end
