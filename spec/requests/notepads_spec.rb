require 'rails_helper'

describe 'Notepad API', type: :request do
  let(:user) { create(:user) }
  let(:headers) { valid_headers }
  let!(:notepads) { create(:notepad, user_id: user.id) }

  describe 'GET /notepads' do
    before { get '/api/v1/notepads', params: {}, headers: headers }

    it 'returns all notpads' do
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(1)
    end
  end
end
