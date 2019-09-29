require 'rails_helper'

describe 'posting a terminology', :type => :request do
  before do
    post '/terminologies', params: { :english => 'risk' }
  end

  context 'English terminology is unique' do
    it 'returns a status of "successful"' do
      expect(JSON.parse(response.body)['status']).to eq("successful")
    end

    it 'returns a result of "stored"' do
      expect(JSON.parse(response.body)['result']).to eq("stored")
    end

    it 'returns the object' do
      expect(JSON.parse(response.body)['terminology']["id"]).to eq(1)
      expect(JSON.parse(response.body)['terminology']["english"]).to eq("risk")
      expect(JSON.parse(response.body)['terminology']["pig_latin"]).to eq("iskray")
    end
  end

  context 'English terminology is not unique' do
    it 'returns a status of "successful"' do
      post '/terminologies', params: { :english => 'risk' }
      expect(JSON.parse(response.body)['status']).to eq("successful")
    end

    it 'returns a result of "already_stored"' do
      post '/terminologies', params: { :english => 'risk' }
      expect(JSON.parse(response.body)['result']).to eq("already_stored")
    end

    it 'returns the object' do
      post '/terminologies', params: { :english => 'risk' }
      expect(JSON.parse(response.body)['terminology']["id"]).to eq(nil)
      expect(JSON.parse(response.body)['terminology']["english"]).to eq("risk")
      expect(JSON.parse(response.body)['terminology']["pig_latin"]).to eq("iskray")
    end
  end
end

describe 'failed posting of a terminology', :type => :request do
  before do
    post '/terminologies', params: { :english => nil }
  end

  it 'returns a status of "error"' do
    expect(JSON.parse(response.body)['status']).to eq("error")
  end
  it 'returns a result of "not_stored"' do
    expect(JSON.parse(response.body)['result']).to eq("not_stored")
  end
end
