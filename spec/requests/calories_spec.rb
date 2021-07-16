require 'rails_helper'

describe 'Calory API', type: :request do
  let(:user) { create(:user) }
  let(:headers) { valid_headers }
  let!(:calories) { create(:calory, user_id: user.id) }

  describe 'GET /calories' do
    before { get '/api/v1/calories', params: {}, headers: headers }

    it 'returns all calories' do
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(1)
    end
  end
end
