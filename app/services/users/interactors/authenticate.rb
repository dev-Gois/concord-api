module Users
  module Interactors
    class Authenticate
      include Interactor

      delegate :user, :user_params, to: :context

      def call
        raise "Password is required" unless user_params[:password].present?
        raise "Password is incorrect" unless user.authenticate(user_params[:password])
        context.user = user
      rescue StandardError => e
        context.fail!(message: e.message)
      end
    end
  end
end
