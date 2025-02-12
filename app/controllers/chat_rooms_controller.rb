class ChatRoomsController < ApplicationController
  def create
    result = ChatRooms::Organizers::Create.call(
      user: @current_user,
      chat_room_params: chat_room_params,
      members_params: members_params
    )

    if result.success?
      render json: ChatRoomSerializer.new(result.chat_room).serializable_hash.to_json, status: :created
    else
      render json: { errors: result.message }, status: :unprocessable_entity
    end
  end

  private

  def chat_room_params
    params.require(:chat_room).permit(:name)
  end

  def members_params
    params.require(:members)
  end
end
