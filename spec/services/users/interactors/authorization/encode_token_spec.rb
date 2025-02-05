require 'rails_helper'

RSpec.describe Users::Interactors::Authorization::EncodeToken do
  describe '.call' do
    let(:user) { create(:user) }

    it 'encodes a token' do
      result = described_class.call(user: user)
      expect(result.jwt_token).to be_present
    end
  end
end
