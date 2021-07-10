require 'rails_helper'

describe 'Calory API', type: :request do
  describe 'GET /calories' do
    before do
      FactoryBot.create(:calory, date: "1 june 2021", calories_lost: "0.002")
      FactoryBot.create(:calory, date: "2 june 2021", calories_lost: "0.02")
    end
    it 'returns all calories' do
      get '/api/v1/calories'

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(2)
    end
  end

  describe 'POST /calories' do
    it 'creates new  calories' do
      expect {
        post '/api/v1/calories', params: { calory: {date: "1 june 2021", calories_lost: "0.002"}}
    }.to change { Calory.count }.from(0).to(1)

      expect(response).to have_http_status(:created)
    end
  end

  describe 'DELETE /calory/:id' do
    let!(:calory) {FactoryBot.create(:calory, date: "1 june 2021", calories_lost: "0.002")}
    it 'deletes a calory' do
      expect {
        delete "/api/v1/calories/#{calory.id}"
    }.to change { Calory.count }.from(1).to(0)

      expect(response).to have_http_status(:no_content)
    end
  end
end