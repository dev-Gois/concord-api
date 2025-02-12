class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room

  validates :content, presence: true

  after_create :broadcast_message

  private

  def broadcast_message
    chat_room.users.each do |user|
      ActionCable.server.broadcast(
        "user_#{user.id}",
        {
          type: "new_message",
          message: MessageSerializer.new(self).serializable_hash
        }
      )
    end
  end
end
