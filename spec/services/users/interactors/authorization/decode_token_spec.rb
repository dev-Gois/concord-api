require 'rails_helper'

RSpec.describe Users::Interactors::Authorization::DecodeToken do
  describe '.call' do
    let(:user) { create(:user) }

    it 'decodes a token' do
      result = Users::Interactors::Authorization::EncodeToken.call(user: user)
      decoded_token = described_class.call(jwt_token: result.jwt_token)
      expect(decoded_token.user).to eq(user)
    end
  end
end
