module Messages
  module Interactors
    class Create
      include Interactor

      delegate :params, :chat_room, :user, to: :context

      def call
        raise "Message is required" unless params.present?
        raise "Chat room is required" unless chat_room.present?
        context.message = create
      rescue StandardError => e
        context.fail!(message: e.message)
      end

      private

      def create
        chat_room.messages.create!(params.merge(user: user))
      end
    end
  end
end
