module ChatRooms
  module Interactors
    class Index
      include Interactor

      delegate :user, to: :context

      def call
        context.chat_rooms = fetch_chat_rooms
      end

      private

      def fetch_chat_rooms
        user.chat_rooms
      end
    end
  end
end