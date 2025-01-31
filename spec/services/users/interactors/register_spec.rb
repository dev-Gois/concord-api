require 'rails_helper'

RSpec.describe Users::Interactors::Register do
  describe '.call' do
    let(:user_params) do
      {
        name: 'John Doe',
        email: 'johndoe@johndoe.com',
        password: 'password',
        password_confirmation: 'password'
      }
    end

    context 'when user_params are valid' do
      it 'creates a new user' do
        result = described_class.call(user_params: user_params)
        expect(result.user).to be_persisted
      end
    end

    context 'when user_params are invalid' do
      it 'does not create a new user' do
        user_params[:email] = nil
        expect { described_class.call(user_params: user_params) }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end
end
