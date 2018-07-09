module CampaignInspector
  class Comparator
    attr_reader :remote_campaigns

    def initialize(remote_campaigns:)
      @remote_campaigns = remote_campaigns
    end

    def run
      remote_campaigns.map do |rc|
        lc = Campaign.find_by_external_reference(rc[:reference].to_i)
        compare(normalize_campaign(lc), rc)
      end.compact
    end

    private

    def compare(local_data, remote_data)
      reference = remote_data.delete(:reference)
      diff = HashDiff.diff(local_data, remote_data)

      return if diff.empty?

      {
        remote_reference: reference,
        discrepancies: diff.map do |d|
          {
            d[1].to_sym => {
              remote: d[3],
              local: d[2]
            }
          }
        end
      }
    end

    def normalize_campaign(campaign)
      {
        status: campaign&.status,
        description: campaign&.ad_description
      }
    end
  end
end
