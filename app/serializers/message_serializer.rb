class MessageSerializer
  include JSONAPI::Serializer

  attributes :id, :content, :chat_room_id, :created_at

  attribute :user do |message|
    UserSerializer.new(message.user).serializable_hash[:data][:attributes]
  end
end
