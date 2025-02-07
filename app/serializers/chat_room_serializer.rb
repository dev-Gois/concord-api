class ChatRoomSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :chat_type

  attribute :owner_name do |chat_room|
    chat_room.user_chat_rooms.find_by(role: :admin)&.user&.name
  end
end
