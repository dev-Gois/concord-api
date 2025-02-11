module ChatRooms
  module Interactors
    class Find
      include Interactor

      delegate :chat_room_id, to: :context

      def call
        raise "Chat room is required" unless chat_room_id.present?
        context.chat_room = find
      rescue StandardError => e
        context.fail!(message: e.message)
      end

      private

      def find
        @chat_room = ChatRoom.find_by(id: chat_room_id)
      end
    end
  end
end
