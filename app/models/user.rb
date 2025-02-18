class User < ApplicationRecord
  has_secure_password

  has_many :user_chat_rooms
  has_many :chat_rooms, through: :user_chat_rooms

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
  validates :color, presence: true
end
