require 'spec_helper'

RSpec.describe CampaignInspector::Campaign do
  describe '#all' do
    it 'returns all local Campaigns' do
      data = subject.class.all

      expect(data.size).to eq(3)
      expect(data[0].id).to eq(1)
      expect(data[0].job_id).to eq(10)
      expect(data[0].status).to eq('active')
      expect(data[0].external_reference).to eq(1)
      expect(data[0].ad_description).to eq('SPEC Senior Ruby developer')
    end
  end

  describe '#find_by_external_reference' do
    it 'returns a local Campaign by its external reference' do
      data = subject.class.find_by_external_reference(1)

      expect(data.id).to eq(1)
      expect(data.job_id).to eq(10)
      expect(data.status).to eq('active')
      expect(data.external_reference).to eq(1)
      expect(data.ad_description).to eq('SPEC Senior Ruby developer')
    end
  end
end
