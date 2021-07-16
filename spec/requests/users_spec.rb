# rubocop:disable Layout/LineLength
require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let!(:user) { build(:user) }
  let(:headers) { valid_headers.except('Authorization') }
  let(:valid_attributes) do
    attributes_for(:user, password_confirmation: user.password)
  end

  # User signup test suite
  describe 'POST /signup' do
    describe 'when valid request' do
      it 'creates a new user' do
        post '/signup', params: valid_attributes.to_json, headers: headers
        expect(response).to have_http_status(201)
      end

      it 'returns success message' do
        post '/signup', params: valid_attributes.to_json, headers: headers
        expect(json['message']).to match(/Account created successfully/)
      end

      it 'returns an authentication token' do
        post '/signup', params: valid_attributes.to_json, headers: headers
        expect(json['auth_token']).not_to be_nil
      end
    end

    context 'when invalid request' do
      before { post '/signup', params: {}, headers: headers }

      it 'does not create a new user' do
        expect(response).to have_http_status(422)
      end

      it 'returns failure message' do
        expect(json['message'])
          .to match(/Validation failed: Password can't be blank, Username can't be blank, Email can't be blank, Email is invalid/)
      end
    end
  end
end
# rubocop:enable Layout/LineLength
