class UserChatRoomSerializer
  include JSONAPI::Serializer
  attributes :role

  attribute :user do |user_chat_room|
    UserSerializer.new(user_chat_room.user).serializable_hash[:data][:attributes]
  end
end
