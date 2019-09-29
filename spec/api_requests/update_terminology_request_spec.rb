require 'rails_helper'

describe 'updating a terminology', :type => :request do
  before(:each) do
    @terminology = FactoryBot.create(:random_terminology)
  end

  it 'can update the terminology' do
    new_terminology = Faker::Construction.material

    put "/terminologies/#{@terminology.id}", params: { english: new_terminology }
    expect(JSON.parse(response.body)['result']).to eq('updated')
    expect(JSON.parse(response.body)['terminology']['english']).to eq(new_terminology)
  end

  it 'can fail to update the terminology' do
    @another_terminology = FactoryBot.create(:random_terminology)
    put "/terminologies/#{@terminology.id}", params: { english: @another_terminology.english }
    expect(JSON.parse(response.body)['result']).to eq('no_change')
    expect(JSON.parse(response.body)['reason']).to eq('already_stored')
    expect(JSON.parse(response.body)['terminology']['english']).to eq(@terminology.english)
    expect(JSON.parse(response.body)['terminology']['pig_latin']).to eq(@terminology.pig_latin)
  end
end
