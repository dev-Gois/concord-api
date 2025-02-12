class UserChannel < ApplicationCable::Channel
  def subscribed
    if current_user
      stream_from "user_#{current_user.id}"
      transmit_initial_data
    else
      reject_subscription
    end
  end

  def unsubscribed
    stop_all_streams
  end

  private

  def transmit_initial_data
    data = {
      type: 'initial_data',
      user: UserSerializer.new(current_user).serializable_hash,
      chat_rooms: ChatRoomSerializer.new(current_user.chat_rooms).serializable_hash
    }

    transmit(data)
  end
end