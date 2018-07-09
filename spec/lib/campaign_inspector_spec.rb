require 'spec_helper'

RSpec.describe CampaignInspector do
  it 'has a version number' do
    expect(CampaignInspector::VERSION).not_to be nil
  end

  describe '#call' do
    let(:remote_data) do
      [
        {
          reference: '1',
          status: 'enabled',
          description: 'Description for campaign 11'
        }
      ]
    end

    it 'returns the diff between external campaign and local campaign' do
      diff = subject.call(remote_campaigns: remote_data)

      expect(diff[0]).to eq(
        remote_reference: '1',
        discrepancies: [
          {
            description: {
              remote: 'Description for campaign 11',
              local: 'SPEC Senior Ruby developer'
            }
          },
          {
            status: {
              remote: 'enabled',
              local: 'active'
            }
          }
        ]
      )
    end
  end
end
