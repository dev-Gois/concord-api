module Wrappers
  class UserWithToken
    attr_reader :user, :token, :id

    def initialize(user, token)
      @user = user
      @token = token
      @id = user.id
    end
  end
end