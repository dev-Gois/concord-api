module ChatRooms
  module Interactors
    class Create
      include Interactor

      delegate :chat_room_params, to: :context

      def call
        raise "Chat room name is required" unless chat_room_params[:name].present?
        context.chat_room = create
      rescue StandardError => e
        context.fail!(message: e.message)
      end

      private

      def create
        ChatRoom.create!(chat_room_params)
      end
    end
  end
end
