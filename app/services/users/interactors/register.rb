module Users
  module Interactors
    class Register
      include Interactor

      delegate :user_params, to: :context

      def call
        context.user = User.create!(user_params)
      end
    end
  end
end
