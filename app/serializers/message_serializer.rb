class MessageSerializer
  include JSONAPI::Serializer

  attributes :content, :chat_room_id

  attribute :user do |message|
    UserSerializer.new(message.user).serializable_hash[:data][:attributes]
  end
end
