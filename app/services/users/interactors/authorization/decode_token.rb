module Users
  module Interactors
    module Authorization
      class DecodeToken
        include Interactor

        delegate :jwt_token, to: :context

        def call
          context.user = decode_token
        end

        private

        def decode_token
          JWT.decode(jwt_token, ENV["JWT_SECRET"], true, algorithm: "HS256")
          payload = JWT.decode(jwt_token, ENV["JWT_SECRET"], true, algorithm: "HS256")[0]
          User.find(payload["user_id"])
        rescue JWT::ExpiredSignature
          context.fail!(error: "Expired token")
        rescue JWT::DecodeError
          context.fail!(error: "Invalid token")
        rescue ActiveRecord::RecordNotFound
          context.fail!(error: "User not found")
        end
      end
    end
  end
end
