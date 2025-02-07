class ChatRoomsController < ApplicationController
  
    def create
        
        result = ChatRooms::Interactors::Create.call(user: current_user, chat_room_params: chat_room_params)

        if result.success?
          render json: ChatRoomSerializer.new(result.chat_room).serializable_hash.to_json, status: :created
        else
          render json: { errors: result.error }, status: :unprocessable_entity
        end
    end

    private

    def chat_room_params
        params.require(:chat_room).permit(:name, :chat_type)
    end

end
