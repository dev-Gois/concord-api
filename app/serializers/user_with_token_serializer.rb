class UserWithTokenSerializer
  include JSONAPI::Serializer
  attributes :id

  attribute :user do |object|
    UserSerializer.new(object.user).serializable_hash[:data][:attributes]
  end

  attribute :token do |object|
    object.token
  end
end
