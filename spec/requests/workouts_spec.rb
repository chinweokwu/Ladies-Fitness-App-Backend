require 'rails_helper'

describe 'Workout API', type: :request do
  describe 'GET /workouts' do
    it 'returns all workouts' do
      get '/api/v1/workouts'

      expect(response).to have_http_status(:success)
    end
  end
end