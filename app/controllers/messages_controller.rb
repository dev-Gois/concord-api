class MessagesController < ApplicationController
  def create
    result = Messages::Organizers::Create.call(
      user: @current_user,
      params: message_params,
      chat_room_id: params[:chat_room_id]
    )

    if result.success?
      render json: MessageSerializer.new(result.message).serializable_hash.to_json, status: :created
    else
      render json: { errors: result.message }, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
