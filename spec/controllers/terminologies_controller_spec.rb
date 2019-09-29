require 'rails_helper'

RSpec.describe TerminologiesController, type: :controller do
  describe '#index' do
    before(:each) do
      @terminology = FactoryBot.create(:random_terminology)
      @another_terminology = FactoryBot.create(:random_terminology)
    end

    it 'responds with 200' do
      get :index
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['translations'][1]['english']).to eq(@terminology.english)
    end

    it 'responds with 200' do
      get :index
      expect(JSON.parse(response.body)['translations'][1]['english']).to eq(@terminology.english)
      expect(JSON.parse(response.body)['translations'][0]['english']).to eq(@another_terminology.english)
    end
  end
end
