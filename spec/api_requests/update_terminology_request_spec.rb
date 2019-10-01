require 'rails_helper'

describe 'sending an update request', :type => :request do
  before(:each) do
    @terminology = FactoryBot.create(:random_terminology)
  end

  it 'can update the terminology' do
    new_terminology = Faker::Construction.material

    put "/terminologies/#{@terminology.id}", params: { english: new_terminology }
    expect(JSON.parse(response.body)['result']).to eq('updated')
    expect(JSON.parse(response.body)['terminology']['english']).to eq(new_terminology)
  end
end
