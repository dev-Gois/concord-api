module ChatRooms
  module Interactors
    class Create
      include Interactor

      delegate :user, :chat_room_params, to: :context

      def call
        raise "User is required" unless user
        raise "Chat room name is required" unless chat_room_params[:name].present?
        raise "Chat room type is required" unless chat_room_params[:chat_type].present?

        chat_room = ChatRoom.create!(chat_room_params)

        user_chat_room = UserChatRoom.create!(user: user, chat_room: chat_room, role: :admin)

        context.chat_room = chat_room
        context.user_chat_room = user_chat_room

      rescue StandardError => e
        context.fail!(message: e.message)
      end
    end
  end
end
