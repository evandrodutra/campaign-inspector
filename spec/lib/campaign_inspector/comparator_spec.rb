require 'spec_helper'

RSpec.describe CampaignInspector::Comparator do
  subject { CampaignInspector::Comparator }

  let(:equal_campaign) do
    [
      {
        reference: '1',
        status: 'active',
        description: 'SPEC Senior Ruby developer'
      }
    ]
  end

  let(:different_campaign) do
    [
      {
        reference: '1',
        status: 'enabled',
        description: 'This campaign has a different text'
      }
    ]
  end

  let(:unexisting_campaign) do
    [
      {
        reference: '10',
        status: 'deleted',
        description: 'This campaign is not in local data'
      }
    ]
  end

  it 'returns an empty array for equal campaigns' do
    diff = subject.new(remote_campaigns: equal_campaign).run

    expect(diff).to eq([])
  end

  it 'returns the diff for local and external campaigns' do
    diff = subject.new(remote_campaigns: different_campaign).run

    expect(diff[0]).to eq(
      remote_reference: '1',
      discrepancies: [
        {
          description: {
            remote: 'This campaign has a different text',
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

  it 'returns the diff for a campaign existing only on external source' do
    diff = subject.new(remote_campaigns: unexisting_campaign).run

    expect(diff[0]).to eq(
      remote_reference: '10',
      discrepancies: [
        {
          description: {
            remote: 'This campaign is not in local data',
            local: nil
          }
        },
        {
          status: {
            remote: 'deleted',
            local: nil
          }
        }
      ]
    )
  end
end
