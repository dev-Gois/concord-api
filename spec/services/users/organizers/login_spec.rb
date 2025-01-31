require 'rails_helper'

RSpec.describe Users::Organizers::Login do
  describe '.call' do
    let(:user) { create(:user) }
    let(:email) { user.email }
    let(:password) { user.password }
    let(:user_params) { { email: email, password: password } }

    subject { described_class.call(user_params: user_params) }

    context 'when user is found' do
      context 'when password is correct' do
        it 'succeeds' do
          expect(subject.success?).to be true
        end

        it 'returns the user' do
          expect(subject.user).to eq(user)
        end
      end

      context 'when password is incorrect' do
        let(:password) { 'incorrect' }

        it 'fails' do
          expect(subject.success?).to be false
        end

        it 'returns an error message' do
          expect(subject.message).to eq('Password is incorrect')
        end
      end
    end

    context 'when user is not found' do
      let(:email) { 'johndola@gmail.com' }

      it 'fails' do
        expect(subject.success?).to be false
      end

      it 'returns an error message' do
        expect(subject.message).to eq('User not found')
      end

      it 'does not return a user' do
        expect(subject.user).to be_nil
      end
    end
  end
end
