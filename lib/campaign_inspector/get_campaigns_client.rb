module CampaignInspector
  class GetCampaignsClient
    CAMPAIGNS_URL = 'https://mockbin.org/bin/fcb30500-7b98-476f-810d-463a0b8fc3df'

    def self.call
      new.get
    end

    def get
      @response = Typhoeus.get(CAMPAIGNS_URL)

      parse_response
    end

    private

    def parse_response
      JSON.parse(@response.body, symbolize_names: true)[:ads]
    end
  end
end
