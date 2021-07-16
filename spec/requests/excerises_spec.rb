require 'rails_helper'

describe 'Exceris API', type: :request do
  let(:user) { create(:user) }
  let(:headers) { valid_headers }

  describe 'GET /excerises' do
    before { get '/api/v1/workouts/:workout_id/excerises', params: {}, headers: headers }

    it 'returns all excerises' do
      expect(response).to have_http_status(:success)
    end
  end
end
