require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:chat_room) }
  end

  describe 'validations' do
    it { should validate_presence_of(:content) }
  end
end