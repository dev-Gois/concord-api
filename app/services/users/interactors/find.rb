module Users
  module Interactors
    class Find
      include Interactor

      delegate :user_params, to: :context

      def call
        raise "Email is required" unless user_params[:email].present?
        raise "User not found" if find_user.nil?
        context.user = find_user
      rescue StandardError => e
        context.fail!(message: e.message)
      end

      private

      def find_user
        @find_user ||= User.find_by(email: user_params[:email])
      end
    end
  end
end
