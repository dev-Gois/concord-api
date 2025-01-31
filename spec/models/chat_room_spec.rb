require 'rails_helper'

RSpec.describe ChatRoom, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:chat_type)}
    it { should define_enum_for(:chat_type).with_values([:private_chat, :group_chat])}
  end
end
