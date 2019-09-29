require 'rails_helper'

describe 'deleting a terminology', :type => :request do
  before(:each) do
    @terminology = FactoryBot.create(:random_terminology)
  end

  it 'should delete the terminology' do

    get '/terminologies'
    expect(response).to have_http_status(200)
    expect((Terminology.find(@terminology.id)).id).to eq(1)

    delete "/terminologies/#{@terminology.id}"
    expect(JSON.parse(response.body)['result']).to eq('deleted')

    get '/terminologies'
    expect(JSON.parse(response.body)['translations']).to eq([])
  end
end
