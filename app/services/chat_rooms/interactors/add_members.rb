module ChatRooms
  module Interactors
    class AddMembers
      include Interactor

      delegate :user, :chat_room, :chat_room_params, :members_params, to: :context

      def call
        raise "Chat room is required" unless chat_room.present?
        raise "Admin are required" unless user.present?
        raise "Members are required" unless members_params.present?
        add_admin
        add_members
      rescue StandardError => e
        context.fail!(message: e.message)
      end

      private

      def add_admin
        UserChatRoom.create!(user: user, chat_room: chat_room, role: :admin)
      end

      def add_members
        members_params.each do |member|
          UserChatRoom.create!(user_id: member, chat_room: chat_room, role: :member)
        end
      end
    end
  end
end
