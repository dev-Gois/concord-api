class UserSerializer
  include JSONAPI::Serializer
  attributes :name, :email

  attribute :token do |user|
    Users::Interactors::Authorization::EncodeToken.call(user: user).jwt_token
  end
end
