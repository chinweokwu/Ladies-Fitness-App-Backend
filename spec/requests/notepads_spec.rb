require 'rails_helper'

describe 'Notepad API', type: :request do
  describe 'GET /notepads' do
    before do
      FactoryBot.create(:notepad, title: "notepad 1", body: "first notepad test")
      FactoryBot.create(:notepad, title: "notepad 2", body: "second notepad test")
    end
    it 'returns all notpads' do
      get '/api/v1/notepads'

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(2)
    end
  end

  describe 'POST /notepads' do
    it 'creates new  notepads' do
      expect {
        post '/api/v1/notepads', params: { notepad: {title: 'notepad 3', body: 'third notepads'}}
    }.to change { Notepad.count }.from(0).to(1)

      expect(response).to have_http_status(:created)
    end
  end

  describe 'DELETE /notepad/:id' do
    let!(:notepad) {FactoryBot.create(:notepad, title: "notepad ", body: "notepad test")}
    it 'deletes a notepad' do
      expect {
        delete "/api/v1/notepads/#{notepad.id}"
    }.to change { Notepad.count }.from(1).to(0)

      expect(response).to have_http_status(:no_content)
    end
  end
end