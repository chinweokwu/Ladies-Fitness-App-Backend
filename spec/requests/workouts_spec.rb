require 'rails_helper'

describe 'Workout API', type: :request do
  let(:user) { create(:user) }
  let(:headers) { valid_headers }

  describe 'GET /workouts' do
    before  { get '/api/v1/workouts', params: {}, headers: headers }
    it 'returns all workouts' do

      expect(response).to have_http_status(:success)
    end
  end
end