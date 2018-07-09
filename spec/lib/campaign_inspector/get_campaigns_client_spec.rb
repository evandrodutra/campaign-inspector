require 'spec_helper'

RSpec.describe CampaignInspector::GetCampaignsClient do
  before do
    data = double(body: '{"ads":[{"reference":"1","status":"enabled","description":"SPEC Description for campaign 11"}]}')
    allow(Typhoeus).to receive(:get).with(subject.class::CAMPAIGNS_URL).and_return(data)
  end

  describe '#call' do
    it 'returns campaigns from an external source' do
      data = subject.class.call

      expect(data[0][:reference]).to eq('1')
      expect(data[0][:status]).to eq('enabled')
      expect(data[0][:description]).to eq('SPEC Description for campaign 11')
    end
  end
end
