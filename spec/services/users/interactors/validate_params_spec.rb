require 'rails_helper'

RSpec.describe Users::Interactors::ValidateParams do
  describe '.call' do
    let(:user_params) do
      {
        name: 'John Doe',
        email: 'johdoe@johndoe.com',
        password: 'password',
        password_confirmation: 'password'
      }
    end

    context 'when user_params are valid' do
      it 'returns success' do
        result = described_class.call(user_params: user_params)
        expect(result.success?).to be true
      end
    end

    context 'when user_params are invalid' do
      it 'returns failure' do
        user_params[:email] = nil
        result = described_class.call(user_params: user_params)
        expect(result.failure?).to be true
      end
    end
  end
end
