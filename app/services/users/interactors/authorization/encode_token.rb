module Users
  module Interactors
    module Authorization
      class EncodeToken
        include Interactor

        delegate :user, to: :context

        def call
          context.jwt_token = generate_jwt_token
        rescue StandardError => e
          context.fail!(message: e.message)
        end

        private

        def generate_jwt_token
          payload = {
            user_id: user.id,
            exp: 2.weeks.from_now.to_i
          }
          JWT.encode(payload, ENV["JWT_SECRET"], "HS256")
        end
      end
    end
  end
end
