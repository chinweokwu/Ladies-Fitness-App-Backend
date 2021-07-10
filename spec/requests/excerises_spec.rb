require 'rails_helper'

describe 'Exceris API', type: :request do
  describe 'GET /excerises' do
    it 'returns all excerises' do
      get '/api/v1/workouts/:workout_id/excerises'

      expect(response).to have_http_status(:success)
    end
  end
end